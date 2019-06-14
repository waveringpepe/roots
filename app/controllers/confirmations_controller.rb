class ConfirmationsController < Devise::ConfirmationsController
  private
  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource) # In case you want to sign in the user
    if logged_in?(:teacher)
    	new_expert_profile_path
    elsif logged_in?(:user)
    	if current_user.plan_id == 10
    		root_path
    	else
    		memberships_path
    	end
    end
  end
end