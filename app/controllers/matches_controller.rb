class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_match, only: [:show, :edit, :update, :destroy]
  access all: [:index], user: {except: [:new, :destroy, :edit, :create, :update, :show]}, teacher: {except: [:new, :destroy, :edit, :create, :update, :show]}, admin: :all


  # GET /matches
  def index
    @matches = Match.all
    @users = current_user
  end

  # GET /matches/1
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  def create
    @match = Match.new(match_params)

    if @match.save
      MatchMailer.teacher_email.deliver
      MatchMailer.student_email.deliver
      redirect_to @match, notice: 'Match was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /matches/1
  def update
    if @match.update(match_params)
      redirect_to @match, notice: 'Match was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /matches/1
  def destroy
    @match.destroy
    redirect_to matches_url, notice: 'Match was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def match_params
      params.require(:match).permit(:user_id, :student_id, :language_id)
    end
end
