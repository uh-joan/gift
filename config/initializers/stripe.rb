# STRIPE_PUBLIC_KEY = "pk_test_pim5DmVFetHEZO75KX8rAL1K"

Rails.configuration.stripe = {
    :publishable_key => ENV['PUBLISHABLE_kEY'],
    :secret_key => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
