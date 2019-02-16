class AddressesController < ApplicationController
    def new
    end
    
    def create
        @deliveryAddress = current_user.addresses.find_by_address_type_id(1)

        if @deliveryAddress.nil?
            @deliveryAddress = current_user.addresses.new(delivery_address_params)
            @deliveryAddress.country_id = params[:country]
            @deliveryAddress.address_type_id = 1

            if params[:addressType]
                @billingAddress = current_user.addresses.new(delivery_address_params)
                @billingAddress.country_id = params[:country]
                @billingAddress.address_type_id = 2
            else
                @billingAddress = current_user.addresses.new(billing_address_params)
                @billingAddress.country_id = params[:country2]
                @billingAddress.address_type_id = 2
            end
        else 
            @deliveryAddress.update_attributes(delivery_address_params)
            @deliveryAddress.country_id = params[:country]

            @billingAddress = current_user.addresses.find_by_address_type_id(2)

            if params[:addressType]
                @billingAddress.update_attributes(delivery_address_params)
                @billingAddress.country_id = params[:country]
            else
                @billingAddress.name = params[:name2]
                @billingAddress.zip = params[:zip2]
                @billingAddress.address = params[:address2]
                @billingAddress.telephone = params[:telephone2]
                @billingAddress.region = params[:region2]
                @billingAddress.city = params[:city2]
                @billingAddress.country_id = params[:country2]
            end
        end

        @deliveryAddress.save!
        @billingAddress.save!

        redirect_to '/cart/payment'
    end

    def index

    end
    
    private
    def delivery_address_params
        params.permit(:name, :address, :city, :region, :zip, :telephone)
    end

    def billing_address_params
        params.permit(:name2, :address2, :city2, :region2, :zip2, :telephone2)
    end

end
