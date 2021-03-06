class UsersController < ApplicationController
  before_action :authenticate_user!
  access user: {except: [:index]}, teacher: {except: [:index]}, admin: :all

  # GET /User
  def index
    @users = User.paginate(:page => params[:page], :per_page => 100).order(sort_column + " " + sort_direction).where("name LIKE ?", "%#{params[:search]}%")
  end
 
  # GET /User
  def show
    @user = User.find(params[:id])
  end

  private
    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      params[:direction] || "desc"
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
