class SellItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy, :update]
  def new
    @item = Item.new
    @item.images.new
    @sellitem = SellItem.new
  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        @sellitem = SellItem.new(item_id:@item.id)
        unless @sellitem.save
          format.html { render :new, notice: 'ユーザー登録がされていません'}
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
        format.html { redirect_to "/transaction/buy/#{@item.id}", notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end

    end
  end

  def show
    item_foreignKey = Item.find(params[:id])
    @images = Image.where("item_id = #{item_foreignKey.id}")
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        item_foreignKey = Item.find(params[:id])
        @images = Image.where("item_id = #{item_foreignKey.id}")
      if @item.exhibition === true 
        format.html { redirect_to "/transaction/buy/#{@item.id}", notice: '出品を再開しました' }
        format.json { render :show, status: :created, location: @item }
      else
        @item.exhibition === false
        format.html { redirect_to "/transaction/buy/#{@item.id}", notice: '商品を一旦停止しました' }
        format.json { render :show, status: :created, location: @item }
      end
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
    item_foreignKey = Item.find(params[:id])
    @images = Image.find_by("item_id = #{item_foreignKey.id}")
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :money, :exhibition, :soldout, :during_transaction, images_attributes: [:image_url])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
