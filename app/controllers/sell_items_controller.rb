class SellItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy, :update]
  after_action :redirect_save_item, only: [:create, :update]
  def new
    @item = Item.new
    @item.images.new
    @sellItem = SellItem.new
    @mainCategory = Category.where(ancestry: '1')
  end

  def create
    @mainCategory = Category.where(ancestry: '1')
    @brand = Brand.create(brand_params)
    allItem_params = item_params.merge(brand_id: @brand.id)
    @item = Item.new(allItem_params)
    @item.images.new(image_params)
    respond_to do |format|
      if @item.save
        # binding.pry
        @sellItem = SellItem.new(item_id: @item.id)
        unless @sellItem.save
          format.html { render :new, notice: 'ユーザー登録がされていません'}
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
        format.html { redirect_to "/mypage/items/#{@item.id}"}
        format.json { render :show, status: :created, location: @item}
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def update
  end

  def edits
    item_foreignKey = Item.find(params[:id])
    @images = Image.find_by("item_id = #{item_foreignKey.id}")
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :money, :description, :exhibition, :soldout, :during_transaction, :category_id, :size_id, :item_condition_id, :shipping_fee_id, :shipping_method_id, :prefecture_address_id, :ship_date_id, images_attributes: [:image_url])
  end

  def image_params
    params.require(:item).permit(images_attributes: [])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_save_item
    @mainCategory = Category.where(ancestry: '1')
  end

  def brand_params
    params.require(:item).permit(:brand_name)
  end
end
