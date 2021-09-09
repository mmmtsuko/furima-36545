class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]

 def index
  @item = Item.order("created_at DESC")
 end

 def new
   @item = Item.new
 end

 def create
    @item = Item.new(item_params)
   if @item.save
     redirect_to root_path
    else
     render :new
   end
 end

 def show
end
  

 private
  def item_paramas
    params.require(:item).permit(:name, :detail, :category_id, :sales_status_id , :shipping_fee_id, :Prefectre_id, :date_of_shipment_id, :price, :image)
    .merge(user_id: current_user.id)
  end

end


