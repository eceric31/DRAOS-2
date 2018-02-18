class CartsController < ApplicationController

    before_action :authorize, only: [:show]

    def show
        @order_items = current_order.order_items
    end
end
