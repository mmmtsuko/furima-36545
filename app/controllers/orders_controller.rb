class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

 def index
  @order_private= OrderPrivate.new
  @item = Item.find(params[:item_id])
 end
 

  def create
  @order_private = OrderPrivate.new(order_params)
  if @order_private.valid?
    pay_item
    @order_private.save
    return redirect_to root_path
  else
     render :index
  end
end

private

def pay_item
  Payjp.api_key = "sk_test_cb3d8a6bf5eb7ea635eb846a"
  Payjp::Charge.create(
    amount: @item.price, 
    card: order_params[:token],    
    currency: 'jpy'                 
  )
end

def set_item
  @item = Item.find(params[:item_id])
end

 def order_params
   params.require(:order_private).permit(:price, :postal_code, :prefecture_id, :city_name, :house_number_id, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
 end

end
 


