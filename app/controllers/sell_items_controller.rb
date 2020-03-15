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
    respond_to do |format|
      if @item&.save and @item&.images&.first&.save
        @sellItem = SellItem.new(item_id: @item.id)
        unless @sellItem.save
          format.html { render :new, notice: 'ユーザー登録がされていません'}
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
        format.html { redirect_to "/mypage/items/#{@item.id}"}
        format.json { render :show, status: :created, location: @item}
      else
        @item = Item.new
        @item.images.new
        format.html { render patial: 'sell_items/new', collection: @item}
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def update
  end

  def edit
    @images = Image.find_by("item_id = #{@item.id}")
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :money, :description, :exhibition, :soldout, :during_transaction, :category_id, :size_id, :item_condition_id, :shipping_fee_id, :shipping_method_id, :prefecture_address_id, :ship_date_id, images_attributes: [:image_url])
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
