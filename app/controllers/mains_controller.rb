class MainsController < ApplicationController
  before_action :set_item ,only:[:show]

  def index
    @items = Item.all
  end

  def show
    @sellitem = SellItem.find_by(item_id: @item.id)
    @user = User.find(@sellitem.user_id)
  end
  
  
  private
  def set_item
    @item = Item.find(params[:id])
  end
end
