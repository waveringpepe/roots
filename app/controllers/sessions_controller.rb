class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /sessions
  def index
    @sessions = Session.all
    @user = current_user
  end

  # GET /sessions/1
  def show
  end

  # GET /sessions/new
  def new
    @session = Session.new
    @user = current_user
  end

  # GET /sessions/1/edit
  def edit
    @user = current_user
  end

  # POST /sessions
  def create
    @session = Session.new(session_params)

    if @session.save
      redirect_to @session, notice: 'Session was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sessions/1
  def update
    if @session.update(session_params)
      redirect_to @session, notice: 'Session was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sessions/1
  def destroy
    @session.destroy
    redirect_to sessions_url, notice: 'Session was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def session_params
      params[:session]
      params.require(:session).permit(:user_id, :student_id, :language_id, :class_type_id, :date_id, :time_duration_id, :status_id, :payment_id)
    end
end
