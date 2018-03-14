class CartsController < ApplicationController

    before_action :authorize

    def show
        @order_items = current_order.order_items
        @delivery_address = Address.new
        @billing_address = Address.new
    end
end
