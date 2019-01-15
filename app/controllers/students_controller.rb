class StudentsController < ApplicationController

access user: [:home], teacher: {except: [:home]}, site_admin: :all, message: "you shall not pass"

	def home
	
	end

end