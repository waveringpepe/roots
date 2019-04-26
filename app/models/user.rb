class User < ApplicationRecord
  belongs_to :plan
  has_many :charges

  has_many :lessons
  has_many :inverse_lessons, :class_name => "Lesson", :foreign_key => "student_id"

  has_many :matches
  has_many :students, :through => :matches

  has_many :inverse_matches, :class_name => "Match", :foreign_key => "student_id"
  has_many :inverse_students, :through => :inverse_matches, :source => :user

  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :teacher], multiple: false)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  



  validates_presence_of :name, :skype, :email, :language_id, :schedule, :phone_number, :speak_language_2

  # If pro user passes validations (email,password, etc..),
  # then call Stripe and tell Stripe to set up a subscription
  # upon charging the customer's card.
  # Sripe responds back with customer data.
  # Store customer.id as the customer token and save the user.
  attr_accessor :stripe_card_token

  def save_with_subscription
    if valid?
      customer = Stripe::Customer.create(email: email, source: stripe_card_token)
      self.stripe_customer_token = customer.id
      update(
        card_brand: card_brand,
        card_last4: card_last4,
        card_exp_month: card_exp_month,
        card_exp_year: card_exp_year
      )
      save!
      AdminMailer.student_signup.deliver
    end
  end

  def stripe_customer
    if stripe_customer_token?
      Stripe::Customer.retrieve(stripe_customer_token)
    else
      stripe_customer = Stripe::Customer.create(email: email)
      update(stripe_customer_token: stripe_customer.id)
      stripe_customer
    end
  end

  def subscribed?
    stripe_subscription_id? || (expires_at? && Time.zone.now < expires_at)
  end

  def save_as_teacher
    if valid?
      self.assign_attributes(roles: "teacher")
      save!
    end
  end

  def first_name
  	self.name.split.first
  end

  def last_name
  	self.name.split.last
  end

  def age
    age = Date.today.year - birth_date.year - ((Date.today.month > birth_date.month || (Date.today.month == birth_date.month && Date.today.day >= birth_date.day)) ? 0 : 1)
  end

  def check_active_user
    forbidden! unless current_user.active
  end
  
end
