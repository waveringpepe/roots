class TeachersController < ApplicationController

access all: [:home], user: {except: [:home]}, site_admin: :all, message: "you shall not pass"

	def home

	end

end