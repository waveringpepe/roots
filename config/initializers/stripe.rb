Stripe.api_key = ENV["stripe_api_key"]
StripeEvent.signing_secret = ENV['STRIPE_SIGNING_SECRET']





StripeEvent.configure do |events|
	
	events.subscribe "invoice.payment_succeeded", Webhooks::PaymentSucceeded.new
end