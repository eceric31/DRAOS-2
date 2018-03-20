class AdminController < ApplicationController
    before_action :authorizeAdministrator
    helper_method :sort_column, :sort_direction


    def index
        @shoes = Shoe.order("#{sort_column} #{sort_direction}")
        @users = User.where("id != ?", current_user.id)
    end


  private
    def sortable_columns
      ["id", "model", "category_id", "brand_id", "created_at"]
    end
  
    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : "id"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
