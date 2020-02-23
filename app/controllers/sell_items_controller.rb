class SellItemsController < ApplicationController
  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
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
    # @image2 = Image.where("item_id = #{item_foreignKey.id}")
    # binding.pry
    @item = Item.find("#{params[:id]}")
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :money, images_attributes: [:image_url])
  end
end
