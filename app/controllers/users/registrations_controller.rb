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
        if resource.plan_id == 8 || resource.plan_id == 9
          resource.save_with_subscription
        elsif resource.plan_id == 10
          resource.save!
          AdminMailer.student_signup.deliver
        else
          resource.save_as_teacher
          AdminMailer.teacher_signup.deliver
        end
      end
    end
    rescue Stripe::CardError => e
      flash.alert = e.message
      render action: :new
  end
end

private
  def select_plan
    unless (params[:plan] == '1' || params[:plan] == '8' || params[:plan] == '9' || params[:plan] == '10')
      flash[:notice] = "Please select a membership plan to sign up."
      redirect_to root_url
    end
  end



