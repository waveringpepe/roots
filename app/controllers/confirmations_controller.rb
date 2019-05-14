class ConfirmationsController < Devise::ConfirmationsController
  private
  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource) # In case you want to sign in the user
    if logged_in?(:teacher)
    	lessons_path
    elsif logged_in?(:user)
    	memberships_path
    end
  end
end