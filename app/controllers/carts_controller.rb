class CartsController < ApplicationController

    before_action :authorize

    def new
        respond_to do |format|
            format.js
        end
    end
    
    def create
        redirect_to action: "index"
    end

    def index
        respond_to do |format|
            format.js
        end
    end

    def show
        @order_items = current_order.order_items
        @delivery_address = Address.new
        @billing_address = Address.new
    end
end
