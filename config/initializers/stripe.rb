Rails.configuration.stripe = {
  :publishable_key => "pk_test_RIvmw7aRE0IJW3DNeyjHadit",
  :secret_key      => "sk_test_jFz9pX7rASrDmJD46wGQ9WdN"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]