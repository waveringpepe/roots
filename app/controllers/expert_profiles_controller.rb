class ExpertProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expert_profile, only: [:show, :edit, :update, :destroy]
  access all: [:edit, :new, :update], user: {except: [:index, :destroy, :show ]}, teacher: {except: [:index, :destroy, :show]}, admin: :all

  helper_method :sort_column, :sort_direction

  # GET /expert_profiles
  def index
    @expert_profiles = ExpertProfile.paginate(:page => params[:page], :per_page => 100).order(sort_column + " " + sort_direction)

  end

  # GET /expert_profiles/1
  def show
    
  end

  # GET /expert_profiles/new
  def new
    @expert_profile = ExpertProfile.new
  end

  # GET /expert_profiles/1/edit
  def edit
  end

  # POST /expert_profiles
  def create
    @expert_profile = ExpertProfile.new(expert_profile_params)

    if @expert_profile.save
      redirect_to root_path, notice: 'Expert profile was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /expert_profiles/1
  def update
    if @expert_profile.update(expert_profile_params)
      redirect_to @expert_profile, notice: 'Expert profile was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /expert_profiles/1
  def destroy
    @expert_profile.destroy
    redirect_to expert_profiles_url, notice: 'Expert profile was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expert_profile
      @expert_profile = ExpertProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def expert_profile_params
      params.require(:expert_profile).permit(:status_id, :bank_account_number, :bank_account_name, :user_id, :bank_account_user_name, :paypal_account)
    end

    def sort_column
      Lesson.column_names.include?(params[:sort]) ? params[:sort] : "status_id"
    end
    
    def sort_direction
      params[:direction] || "desc"
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
