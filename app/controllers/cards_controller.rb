class CardsController < ApplicationController
  require 'payjp'
  add_breadcrumb 'ファイクメルク', :root

  def new
    add_breadcrumb 'マイページ', mypage_path
    add_breadcrumb '支払い方法', mypage_card_create_path
    add_breadcrumb 'クレジットカード情報入力'
    session[:previous_page] = request.referer
    card = Card.where(user_id: current_user.id)
    redirect_to action: 'index' if card.exists?
    year = Time.now.year
    @year = []
    11.times do |i|
      @year[i] = [year - 2000,year]
      year += 1
    end

    @month = []
    12.times do |i|
      @month[i] = sprintf('%02d', i + 1)
    end
  end

  def pay # payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if params['payjp-token'].blank?
      redirect_to action: 'new'
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to session[:previous_page]
      else
        redirect_to action: 'pay'
      end
    end
  end

  def destroy # PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first
    if card.present?
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_back(fallback_location: root_url)
  end

  def index # Cardのデータpayjpに送り情報を取り出します
    add_breadcrumb 'マイページ', mypage_path
    add_breadcrumb '支払い方法'
    @card = Card.where(user_id: current_user.id).first
    if @card.present?
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @exp_month = @default_card_information.exp_month.to_s
      @exp_year = @default_card_information.exp_year.to_s.slice(2, 3)
    end
  end
end
