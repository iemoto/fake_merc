class TransactionsController < ApplicationController
  def buy
    @item = Item.find(params[:id])
    @card = Card.where(user_id: current_user.id).first
    @transact = SellMoney.create(user_id: current_user.id, sell_item_id: @item.id, sell_money: @item.money)
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.retrieve(@card.customer_id)

    Payjp::Charge.create(
      # 決済する金額
      amount: @item.money,
      customer: @card.customer_id,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    redirect_to root_path
    flash[:notice] = '商品の購入を完了しました'
  end
end
