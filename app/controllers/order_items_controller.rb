class OrderItemsController < ApplicationController
    before_action :authorize

    def create
        @order = current_order
        @order_item = @order.order_items.new(order_item_params)
        if @order_item.save!
            if(params[:buy])
                redirect_to '/cart'
            else
                redirect_back fallback_location: "/"
            end
        else
            redirect_to '/'
        end
    end
    
    def update
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.update_attributes(order_item_params)
        @order_items = @order.order_items
    end
    
    def destroy
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.destroy
        @order_items = @order.order_items
        redirect_to '/cart'
    end
private
    def order_item_params
        params.fetch(:order_item, {}).permit(:quantity, :shoe_id, :size)
    end
end
