class UsersController < ApplicationController
  before_action :authenticate_user!
  access user: {except: [:index]}, teacher: {except: [:index]}, admin: :all



  # GET /User
  def index
    @users = User.all
  end

  # GET /User
  def show
    @user = User.find(params[:id])
  end

end
