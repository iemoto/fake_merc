class SellItemsController < ApplicationController
  def new
  end

  def create
  end

  def show
    @sell_items = Sell_item.includes(:images).order('created_at DESC')
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
