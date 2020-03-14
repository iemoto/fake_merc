class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy, :update]
  def index
  end

  def show
    item_foreignKey = Item.find(params[:id])
    @images = Image.where("item_id = #{item_foreignKey.id}")
  end

  def update
    respond_to do |format|
      if @item.update(active_params)
        item_foreignKey = Item.find(params[:id])
        @images = Image.where("item_id = #{item_foreignKey.id}")
        if @item.exhibition === true
          @item.exhibition = false
          format.html { redirect_to "/mypage/items/#{@item.id}", notice: '出品を再開しました' }
          format.json { render :show, status: :created, location: @item }
        else
          @item.exhibition === false
          @item.exhibition = true
          format.html { redirect_to "/mypage/items/#{@item.id}", notice: '商品を一旦停止しました' }
          format.json { render :show, status: :created, location: @item }
        end
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def active_params
    params.require(:item).permit(:exhibition)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
