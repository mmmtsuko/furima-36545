class ItemsController < ApplicationController
  def index
    @item = Items.all
    
  end
    
  
end