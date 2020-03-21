class MainsController < ApplicationController
  before_action :set_item ,only:[:show]

  def index
    # binding.pry
    # sellitem_id = SellItem.find(@item.id)
    # @user = User.find(sellitem_id.user_id)
  end

  def show
    sellitem_id = SellItem.find(@item.id)
    @user = User.find(sellitem_id.user_id)
  end
end

private
def set_item
  #itemsテーブルの商品一つをidで探す
  @item = Item.find(params[:id])
end