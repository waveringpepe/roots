class PagesController < ApplicationController
  before_action :set_locale
  before_action :authenticate_user!, except: [:faq, :home, :home_ingles, :home_frances, :home_italiano, :home_aleman, :home_español, :home_portugues, :home_ruso, :home_chino]
	# GET request for / which is our home page
  access all: [:home, :faq], teacher: {except: [:students_home]}, user: {except: [:teacher_home]}, admin: :all, message: "you shall not pass"
  


  def home
  	@plan = Plan.all
  	@teacher_plan = Plan.find(1)
  	@basic_plan = Plan.find(5)
    @medium_plan = Plan.find(6)
    @intensive_plan = Plan.find(7)
    @free_plan = Plan.find(8)
    
  end

  def subscriptions
  end


  def faq
  end

  def students_home

  end

  def teachers_home

  end

  def home_ingles

    @plan = Plan.all
    @teacher_plan = Plan.find(1)
    @basic_plan = Plan.find(5)
    @medium_plan = Plan.find(6)
    @intensive_plan = Plan.find(7)
    @free_plan = Plan.find(8)

  end

  def home_frances
    
    @plan = Plan.all
    @teacher_plan = Plan.find(1)
    @basic_plan = Plan.find(5)
    @medium_plan = Plan.find(6)
    @intensive_plan = Plan.find(7)
    @free_plan = Plan.find(8)

  end

  def home_aleman
    
    @plan = Plan.all
    @teacher_plan = Plan.find(1)
    @basic_plan = Plan.find(5)
    @medium_plan = Plan.find(6)
    @intensive_plan = Plan.find(7)
    @free_plan = Plan.find(8)

  end

  def home_italiano
    
    @plan = Plan.all
    @teacher_plan = Plan.find(1)
    @basic_plan = Plan.find(5)
    @medium_plan = Plan.find(6)
    @intensive_plan = Plan.find(7)
    @free_plan = Plan.find(8)

  end

  def home_español
    
    @plan = Plan.all
    @teacher_plan = Plan.find(1)
    @basic_plan = Plan.find(5)
    @medium_plan = Plan.find(6)
    @intensive_plan = Plan.find(7)
    @free_plan = Plan.find(8)

  end

  def home_ruso
    
    @plan = Plan.all
    @teacher_plan = Plan.find(1)
    @basic_plan = Plan.find(5)
    @medium_plan = Plan.find(6)
    @intensive_plan = Plan.find(7)
    @free_plan = Plan.find(8)

  end

  def home_chino
    
    @plan = Plan.all
    @teacher_plan = Plan.find(1)
    @basic_plan = Plan.find(5)
    @medium_plan = Plan.find(6)
    @intensive_plan = Plan.find(7)
    @free_plan = Plan.find(8)

  end

  def home_portugues
    
    @plan = Plan.all
    @teacher_plan = Plan.find(1)
    @basic_plan = Plan.find(5)
    @medium_plan = Plan.find(6)
    @intensive_plan = Plan.find(7)
    @free_plan = Plan.find(8)

  end

end

