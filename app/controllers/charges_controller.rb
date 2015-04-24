class ChargesController < ApplicationController
  before_filter :authenticate_user!

  def new
  end

  def create
    token = params[:stripeToken]

    customer = Stripe::Customer.create(
      card: token,
      plan: 41,
      email: current_user.email
      )

    current_user.subscribed = true
    current_user.stripeid = customer.id
    current_user.subscriptionid = customer.subscriptions.data[0][:id]
    current_user.save

    redirect_to profile_path(current_user)
  end

end

