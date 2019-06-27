Stripe.api_key = ENV["stripe_api_key"]
STRIPE_PUBLIC_KEY = ENV["stripe_publishable_key"]
StripeEvent.signing_secret = ENV["stripe_webhooks_key"]


StripeEvent.configure do |events|
	events.subscribe "charge.succeeded", Webhooks::ChargeSucceeded.new
	events.subscribe "invoice.payment_succeeded", Webhooks::PaymentSucceeded.new
end