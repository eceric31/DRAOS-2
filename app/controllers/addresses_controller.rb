class AddressesController < ApplicationController
    def new
        @deliveryAddress = Address.new
        @billingAddress = Address.new
        respond_to do |format|
            format.js
        end
    end
    
    def create
        params[@deliveryAddress]
        redirect_to action: "index"
    end

    def index
        respond_to do |format|
            format.js
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
