class StudentsController < ApplicationController
before_action :authenticate_user!
access user: [:home], teacher: {except: [:home]}, site_admin: :all, message: "you shall not pass"

	def home
	
	end

end