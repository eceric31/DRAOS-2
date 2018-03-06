class ShoesController < ApplicationController
    respond_to :html, :js

    before_action :authorize, only: [:addToCart]

    def index
        @brands = Brand.all
        unless params[:sort].nil?
            puts 'EVO ME' + params[:sort]
            @brand = Brand.find_by_id(params[:sort])
            @shoes = @brand.shoes
        else
            @shoes = Shoe.all
        end
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
