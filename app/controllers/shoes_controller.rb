class ShoesController < ApplicationController

    before_action :authorize, only: [:addToCart]

    def index
        @shoes = Shoe.all
    end

    def show 
        @shoe = Shoe.find(params[:id])
        @style = Style.find(@shoe.style_id);
        @shoes = @style.shoes;
    end

    def addToCart
        if params[:buy]
            redirect_to '/cart'
        else
            redirect_to action: :show
        end
    end
end
