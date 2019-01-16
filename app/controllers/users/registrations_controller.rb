class Users::RegistrationsController < Devise::RegistrationsController

before_action :select_plan, only: :new

  # Extend default Devise gem behavior so that
  # users signing up with the Pro account (plan id 2)
  # save with a special Stripe subscription function
  # Otherwise Devise signs up as a user as usual.
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 5
          resource.save_with_subscription
        elsif resource.plan_id == 6
          resource.save_with_subscription
        elsif resource.plan_id == 7
          resource.save_with_subscription
        elsif resource.plan_id == 8
          resource.save_with_subscription            
        else
          resource.save_as_teacher
        end
      end
    end
  end
end

private
  def select_plan
    unless (params[:plan] == '1' || params[:plan] == '5'|| params[:plan] == '6'|| params[:plan] == '7' || params[:plan] == '8')
      flash[:notice] = "Please select a membership plan to sign up."
      redirect_to root_url
    end
  end


