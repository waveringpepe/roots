class TeachersController < ApplicationController
before_action :authenticate_user!
access teacher: [:home], user: {except: [:home]}, site_admin: :all, message: "you shall not pass"

	def home

	end



end