class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]


 def index
  @order_private= OrderPrivate.new
  @item = Item.find(params[:item_id])
 end
 

 def create
       @order_private = OrderPrivate.new(order_params)
   if  @order_private.valid?
       @order_address.save
     return redirect_to root_path
   else
      render action: :index
   end
 end
 

private

def set_item
  @item = Item.find(params[:item_id])
end

 def order_params
   params.require(:item_order).permit(:price, :postal_code, :prefecture_id, :city_name, :house_number_id, :building_name, :phone_number).merge(token: params[:token])
 end
end
 