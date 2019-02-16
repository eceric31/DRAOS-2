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

    def create
        @shoe = Shoe.new(shoes_params)
        @shoe.brand = Brand.find(params[:brand])
        @shoe.category = Category.find(params[:category])
        @shoe.style = Style.find(params[:style])
        @shoe.color = Color.find(params[:color])

        size1 = ShoeSize.find_by(size: 5);
        size2 = ShoeSize.find_by(size: 6);
        size3 = ShoeSize.find_by(size: 7);
        size4 = ShoeSize.find_by(size: 8);
        size5 = ShoeSize.find_by(size: 9);
        size6 = ShoeSize.find_by(size: 10);
        size7 = ShoeSize.find_by(size: 11);
        size8 = ShoeSize.find_by(size: 12);
        @shoe.shoe_sizes << size1 << size2 << size3 << size4 << size5 << size6 << size7 << size8;

        @shoe.save!

        redirect_to '/admin/shoes'
    end

    def destroy
        @shoe = Shoe.find(params[:id])
        @shoe.destroy

        redirect_to '/admin/shoes'
    end

    def addToCart
        if params[:buy]
            redirect_to '/cart'
        else
            redirect_to action: :show
        end
    end

    private
    def shoes_params
        params.permit(:model, :price, :photo_url)
    end
end
