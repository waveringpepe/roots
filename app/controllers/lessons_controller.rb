class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /lessons
  def index
    @lessons = Lesson.all
    @user = current_user
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
    redirect_to lessons_url, notice: 'Lesson was successfully destroyed.'
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
end



