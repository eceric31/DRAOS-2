class CategoriesController < ApplicationController

    def show
        @category = Category.find(params[:id])
        @shoes = @category.shoes;
        #@shoes = Shoe.where(:category_id => @category.id)
    end

end
