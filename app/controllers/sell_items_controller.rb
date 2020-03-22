class SellItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy, :update]
  before_action :sell_item, only: [:destroy]
  before_action :item_present?, only: [:show]
  after_action :redirect_save_item, only: [:create, :update]

  def new
    @item = Item.new
    @item.images.new
    @sellItem = SellItem.new
    @mainCategory = Category.where(ancestry: '1')
  end

  def create
    @mainCategory = Category.where(ancestry: '1')
    # @brand = Brand.create(brand_params)
    # allItem_params = item_params.merge(brand_id: @brand.id)
    @item = Item.new(item_params)
    respond_to do |format|
      if @item&.save and @item&.images&.first&.save
        @sellItem = SellItem.new(item_id: @item.id)
        unless @sellItem.save
          format.html { render :new, notice: 'ユーザー登録がされていません'}
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
        format.html { redirect_to root_path}
        format.json { render :show, status: :created, location: @item}
      else
        format.html { redirect_to action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @personal = PersonalUser.find_by(user_id: current_user.id)
    if @personal&.prefecture_address_id
      @address = PrefectureAddress.find(@personal.prefecture_address_id)
    else
      @address = nil
    end
    @card = Card.where(user_id: current_user.id).first
    if @card.present?
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @exp_month = @default_card_information.exp_month.to_s
      @exp_year = @default_card_information.exp_year.to_s.slice(2, 3)
    end
  end

  def edit
    @mainCategory = Category.where(ancestry: '1')
  end

  def update
    @mainCategory = Category.where(ancestry: '1')
    respond_to do |format|
      if @item.update(item_params)
          format.html { redirect_to mypage_items_show_path(@item.id) }
          format.json { render :show, status: :created, location: @item}
      else
          format.html { redirect_to action:  :edit}
      end
    end
  end

  def destroy
    if @sell_item.destroy and @item.destroy
      flash[:notice] = '商品を削除しました'
    else
      flash[:notice] = '商品情報の削除に失敗しました'
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :money, :description, :exhibition, :soldout, :during_transaction, :category_id, :size_id, :item_condition_id, :shipping_fee_id, :brand_name, :shipping_method_id, :prefecture_address_id, :ship_date_id, images_attributes: [:image_url, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_present?
    @item = Item.find(params[:id])
    if @item.soldout
      redirect_to root_path
      flash[:notice] = '商品は存在しません'
    end
  end

  def redirect_save_item
    @mainCategory = Category.where(ancestry: '1')
  end

  def brand_params
    params.require(:item).permit(:brand_name)
  end

  def sell_item
    @sell_item = SellItem.find(params[:id])
  end
end
