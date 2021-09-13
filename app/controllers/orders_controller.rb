class OrdersController < ApplicationController

 def index
 end

 def create
       order = Order.new(order_params)
   if  @order.valid?
       @order.save
     return redirect_to root_path
   else
      render 'index'
    end 
 end
 
 private

 def order_params
   params.require(:item_order).permit(:price, :postal_code, :prefecture_id, :city_name, :house_number_id, :building_name, :phone_number).merge(token: params[:token])
 end
 

 #|postal_code 郵便番号    
 #|prefecture_id  都道府県   
 #|city_name  市町村   
 #|house_number_id 番地 
 #|building_name 建物  
 #|phone_number  電話番号  
           
 
end

