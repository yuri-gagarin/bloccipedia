class ChargesController < ApplicationController

  before_filter :authenticate_user!

  def new
  end

  def edit
    @customer = Stripe::Customer.retrieve(current_user.stripe_id)
    @current_customer = JSON.parse(@customer.to_s)
  end

  def create

    @amount = 1499

    customer = Stripe::Customer.create(
      email: current_user.email,
      source: params[:stripeToken],
      plan: '0625'
    )

    current_user.update_attributes(access_level: 1)
    current_user.stripe_id = customer.id

    if current_user.save!
      flash[:notice] = 'Welcome to premium features. Your 30 day trial starts today!'
      redirect_to(root_path)
    end

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def destroy

    @customer = Stripe::Customer.retrieve(current_user.stripe_id)

    if @customer.delete
      flash[:notice] = 'Sorry to see you go!'
      current_user.update_attributes(access_level: 0)
      redirect_to (root_path)
    else
      flash.now[:alert] = 'Something went wrong'
      render(:edit)
    end

  end

end
