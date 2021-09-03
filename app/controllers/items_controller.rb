class ItemsController < ApplicationController
def index
end

def  edit
end  

def create
end


def update
  if current_item.update(item_params)
    redirect_to root_path
  else
    render :edit
  end
end

private

def user_params
  params.require(:item).permit(:item_name, :text)
end




end