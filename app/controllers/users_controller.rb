class UsersController < ApplicationController
  access all: [:index, :show ]

  # GET /User
  def index
    @users = User.all
  end

  # GET /User
  def show
    @user = User.find(params[:id])
  end

end
