class AdminController < ApplicationController
    before_action :authorizeAdministrator
    helper_method :sort_column, :sort_direction


    def index
        @shoes = Shoe.all
        @users = User.where("id != ?", current_user.id)
    end

    def users
      @users = User.where("id != ?", current_user.id).order("#{sort_column} #{sort_direction}")
    end

    def shoes
      @shoes = Shoe.order("#{sort_column} #{sort_direction}")
    end

    def shoeCreate
      @brands = Brand.all
      @styles = Style.all
      @categories = Category.all
      @colors = Color.all
    end


  private
    def sortable_columns
      ["id", "model", "category_id", "brand_id", "style_id", "color_id",  "price",
        "email", "email_confirmed", "role_id", "created_at"]
    end
  
    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : "id"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
