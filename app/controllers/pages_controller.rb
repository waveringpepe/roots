class PagesController < ApplicationController
  before_action :set_locale
	# GET request for / which is our home page
  access all: [:home, :faq] , site_admin: :all



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

  def faq
  end


end

