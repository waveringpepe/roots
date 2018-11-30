module DeviseWhitelist	
	extend ActiveSupport::Concern

	included do
		before_action :configure_permitted_parameters, if: :devise_controller?
	end

	def configure_permitted_parameters
	 	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, 
	 														:skype,
	 														:phone_number,
	 														:city_id,
	 														:time_zone,
	 														:birth_date,
	 														:language_id,
	 														:reason_id,
	 														:level,
	 														:start_id,
	 														:experience,
	 														:schedule,
	 														:reference,
	 														:promo_code])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:name,
	    													:skype,
	 														:phone_number,
	 														:city_id,
	 														:time_zone,
	 														:birth_date,
	 														:language_id,
	 														:reason_id,
	 														:level,
	 														:start_id,
	 														:experience,
	 														:schedule,
	 														:reference,
	 														:promo_code])
 	end
end