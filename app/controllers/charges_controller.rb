class ChargesController < ApplicationController

  before_filter :authenticate_user!

  def new
  end

  def create

    @amount = 1499

    customer = Stripe::Customer.create(
      email: current_user.email,
      source: params[:stripeToken],
      plan: '0625'
    )

    current_user.access_level = 1 unless current_user.admin?
    current_user.stripe_id = customer.id
    current_user.save!

    redirect_to(root_path)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path

  end

end
