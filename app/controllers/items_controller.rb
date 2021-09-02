class ItemsController < ApplicationController
def index
end

def  edit
end  

def update
  current_item.update(item_params)
end

private

def user_params
  params.require(:item).permit(:item_name, :text)
end
end



end