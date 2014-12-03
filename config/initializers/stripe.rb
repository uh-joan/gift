# STRIPE_PUBLIC_KEY = "pk_test_pim5DmVFetHEZO75KX8rAL1K"

Rails.configuration.stripe = {
    :publishable_key => ENV['PUBLISHABLE_kEY'],
    :secret_key => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

# StripeEvent.subscribe 'charge.succeeded' do |event|
#   Rails.logger.debug "New charge has succeeded, the charge id is #{event.data.object.description}"
# end

StripeEvent.configure do |events|
  events.subscribe 'charge.succeeded', CrawlerSelector.new
end