class Users::RegistrationsController < Devise::RegistrationsController

  # Extend default Devise gem behavior so that
  # users signing up with the Pro account (plan id 2)
  # save with a special Stripe subscription function
  # Otherwise Devise signs up as a user as usual.
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        elsif resource.plan_id == 3
          resource.save_with_subscription
        elsif resource.plan_id == 4
          resource.save_with_subscription 
        else
          resource.save
        end
      end
    end
  end
end