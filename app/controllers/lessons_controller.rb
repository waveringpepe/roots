class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  access all: [:index], user: [:edit , :update, :show, {except: [:new, :create]}], teacher: [:new, :destroy, :edit, :create, :update, :show], admin: :all
  
  helper_method :sort_column, :sort_direction

  # GET /lessons
  def index

    @lessons = Lesson.paginate(:page => params[:page], :per_page => 100).order(sort_column + " " + sort_direction).where("user_id LIKE ?", "%#{params[:search]}%")
    @lessons_students = current_user.inverse_lessons.paginate(:page => params[:page], :per_page => 20).order('date_id DESC')
    @lessons_teachers = current_user.lessons.paginate(:page => params[:page], :per_page => 20).order('date_id DESC')
    @user = current_user
    @renderer = custom_paginate_renderer

    #adminpanel
    @proximas_admin = Lesson.where( status_id: "Próxima").count(:time_duration_id)
    @completadas_admin = Lesson.where( status_id: "Completada").count(:time_duration_id)
    @horas_completadas_admin = Lesson.where( status_id: "Completada").sum(:time_duration_id)/60

    @deuda_profesores_admin = Lesson.where( status_id: "Completada", payment_id: "No").sum(:time_duration_id)/60*200 + Lesson.where( status_id: "Perdida por el estudiante", payment_id: "No").sum(:time_duration_id)/60*200
    @monto_total_pagado_admin = Lesson.where( status_id: "Completada", payment_id: "Si").sum(:time_duration_id)/60*200 + Lesson.where( status_id: "Perdida por el estudiante", payment_id: "Si").sum(:time_duration_id)/60*200

    @clases_perdidas_profesores_admin = Lesson.where( status_id: "Perdida por el profesor").count(:time_duration_id)
    @monto_perdido_profesores_admin = Lesson.where( status_id: "Perdida por el profesor", payment_id: "Si").sum(:time_duration_id)/60*200
    @clases_perdidas_estudiantes_admin = Lesson.where( status_id: "Perdida por el estudiante").count(:time_duration_id)
    @monto_perdido_estudiantes_admin = Lesson.where( status_id: "Perdida por el estudiante", payment_id: "Si").sum(:time_duration_id)/60*200

    #teacherspanel
    @clases_proximas_profesores = @user.lessons.where( status_id: "Próxima").count(:time_duration_id)
    @clases_completadas_profesores = @user.lessons.where( status_id: "Completada").count(:time_duration_id)
    @horas_completadas_profesores = @user.lessons.where( status_id: "Completada").sum(:time_duration_id)/60

    @monto_por_recibir_profesores = @user.lessons.where( status_id: "Completada", payment_id: "No").sum(:time_duration_id)/60*200 + @user.lessons.where( status_id: "Perdida por el estudiante", payment_id: "No").sum(:time_duration_id)/60*200 - @user.lessons.where( status_id: "Perdida por el profesor", payment_id: "No").sum(:time_duration_id)/60*200
    @monto_total_ganado_profesores = @user.lessons.where( status_id: "Completada", payment_id: "Si").sum(:time_duration_id)/60*200 + @user.lessons.where( status_id: "Perdida por el estudiante", payment_id: "Si").sum(:time_duration_id)/60*200 - @user.lessons.where( status_id: "Perdida por el profesor", payment_id: "Si").sum(:time_duration_id)/60*200

    @clases_ganadas_profesores = @user.lessons.where( status_id: "Perdida por el estudiante").count(:time_duration_id)
    @monto_ganado_profesores = @user.lessons.where( status_id: "Perdida por el estudiante", payment_id: "Si").sum(:time_duration_id)/60*200
    @clases_perdidas_profesores = @user.lessons.where( status_id: "Perdida por el profesor").count(:time_duration_id)
    @monto_perdido_profesores = @user.lessons.where( status_id: "Perdida por el profesor", payment_id: "Si").sum(:time_duration_id)/60*200
    
    #studentspanel

    @clases_proximas_estudiantes = @user.inverse_lessons.where( status_id: "Próxima").count(:time_duration_id)
    @clases_completadas_estudiantes = @user.inverse_lessons.where( status_id: "Completada").count(:time_duration_id)
    @horas_completadas_estudiantes = @user.inverse_lessons.where( status_id: "Completada").sum(:time_duration_id)/60

    @clases_ganadas_estudiantes = @user.inverse_lessons.where( status_id: "Perdida por el profesor").count(:time_duration_id)
    @clases_perdidas_estudiantes = @user.inverse_lessons.where( status_id: "Perdida por el estudiante").count(:time_duration_id)

    




  end

  # GET /lessons/1
  def show

  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
    @user = current_user
  end

  # GET /s/1/edit
  def edit
    @user = current_user
  end

  # POST /s
  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      redirect_to @lesson, notice: 'Lesson was successfully created.'
      if current_user.has_roles?(:teacher)
        LessonMailer.teacher_email(@lesson).deliver
        LessonMailer.student_email(@lesson).deliver
        if @lesson.date_id > Time.now and @lesson.date_id < (Time.now + 25.hours)
          LessonMailer.reminder_lesson_teacher_1(@lesson).deliver_later(wait_until: (@lesson.date_id - 1.hour))
          LessonMailer.reminder_lesson_student_1(@lesson).deliver_later(wait_until: (@lesson.date_id - 1.hour))
        elsif @lesson.date_id > (Time.now + 25.hours)
          LessonMailer.reminder_lesson_teacher_1(@lesson).deliver_later(wait_until: (@lesson.date_id - 1.hour))
          LessonMailer.reminder_lesson_student_1(@lesson).deliver_later(wait_until: (@lesson.date_id - 1.hour))
          LessonMailer.reminder_lesson_teacher_2(@lesson).deliver_later(wait_until: (@lesson.date_id - 25.hours))
          LessonMailer.reminder_lesson_student_2(@lesson).deliver_later(wait_until: (@lesson.date_id - 25.hours))
        end
      end
    else
      render :new
    end
  end

  # PATCH/PUT /lessons/1
  def update
    if @lesson.update(lesson_params)
      redirect_to @lesson, notice: 'Lesson was successfully updated.'
    else
      render :edit
    end

  end

  # DELETE /lessons/1
  def destroy
    @lesson.destroy
    redirect_to lessons_url, notice: "Lesson with id: #{@lesson.id} was successfully destroyed."
    if current_user.has_roles?(:teacher)
      LessonMailer.cancel_lesson_teacher(@lesson).deliver
    elsif current_user.has_roles?(:user)
      LessonMailer.cancel_lesson_student(@lesson).deliver
    elsif current_user.has_roles?(:admin)
      LessonMailer.cancel_lesson_student(@lesson).deliver
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lesson_params
      params[:lesson]
      params.require(:lesson).permit(:user_id, :student_id, :language_id, :class_type_id, :date_id, :time_duration_id, :status_id, :payment_id)
    end

    def sort_column
      Lesson.column_names.include?(params[:sort]) ? params[:sort] : "date_id"
    end
    
    def sort_direction
      params[:direction] || "desc"
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end



