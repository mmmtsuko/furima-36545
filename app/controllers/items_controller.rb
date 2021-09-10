class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]

 def index
  @item = Item.order("created_at DESC")
 end

 def new
   @item = Item.new
 end


 def create
    @item = Item.new (item_params)
   if @item.save
     redirect_to root_path
    else
     render :new
   end
 end

 private

 def item_params
  params.require(:item).permit(:item_name, :text, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :date_of_shipment_id, :price, :image)
  .merge(user_id: current_user.id)
end

 

  

end


