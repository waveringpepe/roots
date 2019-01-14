class StudentsController < ApplicationController

access all: [:home ], teacher: {except: [:home]}, site_admin: :all, message: "you shall not pass"

	def home
	@user = User.all
	end

end