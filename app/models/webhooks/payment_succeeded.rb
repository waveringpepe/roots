module Webhooks
	class PaymentSucceeded 
		def call(event)
			invoice = event.data.object

			user = User.find_by(stripe_customer_token: invoice.customer)

			c = user.charges.where(stripe_customer_token: invoice.id).first_or_create
			c.update(
				amount: invoice.amount_paid
			)
			
		end
	end
end