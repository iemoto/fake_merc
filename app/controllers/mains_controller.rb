class MainsController < ApplicationController
  before_action :set_item ,only:[:show]

  def index
  end

  def show
    sellitem_id = SellItem.find(@item.id)
    @user = User.find(sellitem_id.user_id)

    @images = Image.where("item_id = #{@item.id}")

  end
end

private
def set_item
  # #itemsテーブルの商品一つをidで探す
  @item = Item.find(params[:id])
end