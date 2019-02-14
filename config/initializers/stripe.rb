Stripe.api_key = ENV["stripe_api_key"]
STRIPE_PUBLIC_KEY = ENV["stripe_publishable_key"]

StripeEvent.configure do |events|
	events.subscribe "charge.succeeded", Webhooks::ChargeSucceeded.new
end