class PagesController < ApplicationController
	# GET request for / which is our home page

  def home
  	@plan = Plan.all
  	@teacher_plan = Plan.find(1)
  	@basic_plan = Plan.find(5)
    @medium_plan = Plan.find(6)
    @intensive_plan = Plan.find(7)
    @free_plan = Plan.find(8)
  end

  def about
  end

  def contact
  end
end
