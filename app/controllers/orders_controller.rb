class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_private= OrderPrivate.new
    redirect_to root_path if @item.private.present? || current_user == @item.user
  #＃if user_signed_in? && current_user.id != @item.user_id && @item_private == nil
   # if current_user == @item.user || @item_private.present? 
  #else
    #redirect_to root_path
 # end
  #redirect_to root_path if 商品が売れちゃっていたら ||　商品出品者とログインユーザーが同じなら
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
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
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
 


