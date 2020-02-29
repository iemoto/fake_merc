class SellItemsController < ApplicationController
  before_action :set_item, except: [:new, :create, :show]
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
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    item_foreignKey = Item.find(params[:id])
    @image = Image.find_by("item_id = #{item_foreignKey.id}")
    @item = Item.find("#{params[:id]}")
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to "/transaction/buy/#{@item.id}", notice: 'Item was successfully update.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  #   if @item.update(item_params)
  #     redirect_to "/sell/edit/#{@item.id}"
  #   else
  #     render :edit
  #   end
  # end

  def edit
    item_foreignKey = Item.find(params[:id])
    @image = Image.find_by("item_id = #{item_foreignKey.id}")
    @item = Item.find("#{params[:id]}")
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :money, images_attributes: [:image_url, :_destroy, :id])
  end

  def set_item
    @item = Item.find("#{params[:id]}")
  end
end
