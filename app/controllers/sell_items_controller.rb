class SellItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy, :update]
  def new
    @item = Item.new
    @item.images.new

  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to "/transaction/buy/#{@item.id}", notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        binding.pry
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
        format.html { redirect_to "/transaction/buy/#{@item.id}", notice: 'Item was successfully update.' }
        format.json { render :show, status: :created, location: @item }
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
    params.require(:item).permit(:name, :money, images_attributes: [:image_url])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end