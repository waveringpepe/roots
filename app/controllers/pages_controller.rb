class PagesController < ApplicationController
  before_action :set_locale, :authenticate_user!, except: [:about, :contact, :faq, :home]
	# GET request for / which is our home page
  access all: [:home, :faq, :about, :contact],teacher: {except: [:students_home]}, user: {except: [:teacher_home]}, site_admin: :all, message: "you shall not pass"
  


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

  def students_home

  end

  def teachers_home

  end

end

