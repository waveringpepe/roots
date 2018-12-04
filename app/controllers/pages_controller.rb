class PagesController < ApplicationController
	# GET request for / which is our home page

  def home
  	@basic_plan = Plan.find(2)
  	@pro_plan = Plan.find(3)
  end

  def about
  end

  def contact
  end
end
