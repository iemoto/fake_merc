class SellItemsController < ApplicationController
  before_action :set_item, only: [:edit, :destroy, :update]
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
    @brand = Brand.create(brand_params)
    allItem_params = item_params.merge(brand_id: @brand.id)
    @item = Item.new(allItem_params)
    binding.pry
    respond_to do |format|
      if @item.save
        @sellItem = SellItem.new(item_id: @item.id)
        unless @sellItem.save
          format.html { render :new, notice: 'ユーザー登録がされていません'}
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
        format.html { redirect_to "/mypage/items/#{@item.id}"}
        format.json { render :show, status: :created, location: @item}
      else
        format.html { render :new, collection: @item }
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
end
