class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :update, :destroy]
  before_action :get_item, only: [:show, :update, :destroy, :edit]
  before_action :move_to_index, only: [:edit,:destroy,:update]

  def index 
   @item = Item.all.order("created_at DESC")
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

 def show
  @item = Item.find(params[:id])
 end

 def edit
   if @item_private.present?
      redirect_to root_path
   end
 end

 def update
    if @item.update(item_params)
     redirect_to item_path(@item.id)
   else
    render :edit
  end
end
 

 def destroy 
   if user_signed_in? && current_user.id == @item.user_id
     @item.destroy
   else
     redirect_to root_path
   end
 end

private

 
 def item_params
  params.require(:item).permit(:item_name, :text, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :date_of_shipment_id, :price, :image)
  .merge(user_id: current_user.id)
 end

 def get_item
  @item = Item.find(params[:id])
end

 def move_to_index
   redirect_to root_path if current_user.id != Item.find(params[:id]).user_id 
 end

 
end