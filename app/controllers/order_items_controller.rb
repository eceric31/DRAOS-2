class OrderItemsController < ApplicationController
    before_action :authorize

    def create
        @order = current_order
        o_i = OrderItem.new(order_item_params)
        @order_item = @order.order_items.find_by_shoe_id_and_size(o_i.shoe_id, o_i.size)
        unless @order_item.nil?
            @order_item.quantity += o_i.quantity
        else
            @order_item = @order.order_items.new(order_item_params)
        end
        if @order_item.save!
            if(params[:buy])
                redirect_to '/cart'
            else
                flash[:success] = "Added to cart!"                  
                redirect_back(fallback_location: '/')
            end
        else
            redirect_to '/'
        end
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
        params.require(:order_item).permit(:quantity, :shoe_id, :size)
    end

    def check

    end

end
