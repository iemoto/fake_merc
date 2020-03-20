class MainsController < ApplicationController
  before_action :set_item ,only:[:show]

  def index
  end

  def show
  end
end

private

def set_item
  @item = Item.find(params[:id])
end