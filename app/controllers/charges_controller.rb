class ChargesController < ApplicationController
     skip_before_action :verify_authenticity_token


    def new
    end
    
    def create
      @amount = ((current_order.subtotal + current_order.shipping) * 100).to_i
    
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'bam'
      )
      
      
      UserNotifierMailer.send_purchase_confirmation_email(current_user, current_order).deliver
      
      new_order

      flash[:success] = "Order succesfully placed!"
      redirect_to '/cart'
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      
      redirect_to '/'
    end

    private

    def new_order
      old_order = current_order
      old_order.order_status_id = 2
      old_order.save
      order = current_user.orders.new(order_status_id: 1, shipping: 30)
      order.save
    end

end
