class PagesController < ApplicationController
	# GET request for / which is our home page

  def home
  	@plan = Plan.all
  	@basic_plan = Plan.find(1)
  	@pro_plan = Plan.find(2)
  end

  def about
  end

  def contact
  end
end
