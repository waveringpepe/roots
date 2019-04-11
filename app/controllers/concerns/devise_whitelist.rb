module DeviseWhitelist	
	extend ActiveSupport::Concern

	# Whitelist the following form fields so that we can process them, if coming from
	# a Devise sign up form.
	included do
		before_action :configure_permitted_parameters, if: :devise_controller?

	end

	protected

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
	 														:promo_code,
	 														:stripe_card_token,
															:speak_language,
															:teach_language,
															:carrear_id,
															:university_id,
															:experience_teaching,
															:institutions_teach,
															:certificate_id,
															:type_student,
															:years_teaching,
															:country,
															:actual_country,
															:card_brand,
															:card_last4,
															:card_exp_month,
															:card_exp_year,
															:speak_language_2,
															:teacher_description
	 														])
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
	 														:promo_code,
	 														:stripe_card_token,
															:speak_language,
															:teach_language,
															:carrear_id,
															:university_id,
															:experience_teaching,
															:institutions_teach,
															:certificate_id,
															:type_student,
															:years_teaching,
															:country,
															:actual_country,
															:card_brand,
															:card_last4,
															:card_exp_month,
															:card_exp_year,
															:speak_language_2,
															:teacher_description
	 														])
 	end
end