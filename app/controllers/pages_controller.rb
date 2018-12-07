class PagesController < ApplicationController
	# GET request for / which is our home page

  def home
  	@plan = Plan.all
  	@free_plan = Plan.find(1)
  	@basic_plan = Plan.find(2)
    @medium_plan = Plan.find(3)
    @intensive_plan = Plan.find(4)
  end

  def about
  end

  def contact
  end
end
