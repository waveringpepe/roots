class User < ApplicationRecord
  belongs_to :plan
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin, :teacher], multiple: true)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable


  validates_presence_of :name

  # If pro user passes validations (email,password, etc..),
  # then call Stripe and tell Stripe to set up a subscription
  # upon charging the customer's card.
  # Sripe responds back with customer data.
  # Store customer.id as the customer token and save the user.
  attr_accessor :stripe_card_token
  def save_with_subscription
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, source: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end

  def first_name
  	self.name.split.first

  end

  def last_name
  	self.name.split.last
  end
  
end
