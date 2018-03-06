class CategoriesController < ApplicationController
    respond_to :html, :js

    def show
        @brand = Brand.all
        @shoeSize = ShoeSize.all.order(:size)
        @color = Color.all
        @style = Style.all
        @priceRanges = [['30KM-60KM', '1'], ['60KM-90KM', '2'], ['90KM-120KM', '3'], ['120KM - ...', '4']]
        @orderBy = [['Increasing', '1'], ['Decreasing', '2']]
        @category = Category.find(params[:id])

        if !params[:brand].nil?
            less_than = 0
            more_than = 0
            case params[:price_range]
            when '1'
                less_than = 60
                more_than = 30
            when '2'
                less_than = 90
                more_than = 60
            when '3'
                less_than = 120
                more_than = 90
            when '4'
                less_than = 1000000
                more_than = 120
            end
            @shoes = @category.shoes.where("brand_id = ? AND color_id = ? AND style_id = ? 
                                    AND price < ? AND price > ?", 
                            params[:brand], params[:color], params[:style], less_than, more_than)

        elsif !params[:sort].nil?
            puts 'here is sort' + params[:sort]
            @shoes = @category.shoes.order(price: :desc)
        else
            @shoes = @category.shoes
        end
    end

end
