class SellItemsController < ApplicationController
  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.includes(:images).order('created_at DESC')
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

  private

  def item_params
    params.require(:item).permit(:name, :money, images_attributes: [:image_url])
end
