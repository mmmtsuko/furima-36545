class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit,:destroy,:update]
  before_action :get_item, only: [:show, :edit, :update, :destroy]
  

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
 end

 def update
  if @item.update(item_params)
    redirect_to item_path(@item.id)
  else
    render :edit
  end
end

 def destroy
    @item.destroy
    redirect_to root_path
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
  unless current_user.id == @item.user_id
    redirect_to action: :index
  end
end





end 
 


