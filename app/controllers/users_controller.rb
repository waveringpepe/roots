class UsersController < ApplicationController
  before_action :authenticate_user!
  access user: {except: [:index]}, teacher: {except: [:index]}, admin: :all



  # GET /User
  def index
    @users = User.all
    @users = User.paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
    @renderer = custom_paginate_renderer
  end
 
  # GET /User
  def show
    @user = User.find(params[:id])
  end
end
