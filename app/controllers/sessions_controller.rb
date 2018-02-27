class SessionsController < ApplicationController
    def new
      @error = ""
    end
  
    def create
        user = User.find_by_email(params[:email])

        if user && user.authenticate(params[:password])

          order = Order.find_by_user_id_and_order_status_id(user.id, 1)
          if order.nil?
            order = user.orders.new(order_status_id: 1, shipping: 30)
            order.save
          end

          if params[:remember_me]
            cookies.permanent[:auth_token] = user.auth_token
          else
            cookies[:auth_token] = user.auth_token
          end
          redirect_to '/'
        else
          @error = "Incorrect email or password"
          render 'new'
        end
    end
  
    def destroy
      cookies.delete(:auth_token)
      redirect_to '/login', :notice => "Logged out!"
    end

private
    
end
