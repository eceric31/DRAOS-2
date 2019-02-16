class CartsController < ApplicationController

    before_action :authorize

    def show
        @order_items = current_order.order_items
        @delivery_address = Address.new
        @billing_address = Address.new
    end

    def addresses
        @deliveryAddress = current_user.addresses.find_by_address_type_id(1)
        @billingAddress = current_user.addresses.find_by_address_type_id(2)
        @countries = Country.all
    end

    def payment
        @deliveryAddress = current_user.addresses.find_by_address_type_id(1)
        @billingAddress = current_user.addresses.find_by_address_type_id(2)

    end

end
