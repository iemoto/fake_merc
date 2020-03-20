class TransactionsController < ApplicationController
  def buy
    @item = Item.find(params[:id])
    @card = Card.where(user_id: current_user.id).first
    @transact = SellMoney.create(user_id: current_user.id, sell_item_id: @item.id, sell_money: @item.money)
    if @transact.save
      unless @item.soldout
        Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
        customer = Payjp::Customer.retrieve(@card.customer_id)

        Payjp::Charge.create(
          # 決済する金額
          amount: @item.money,
          customer: @card.customer_id,
          card: params['payjp-token'],
          currency: 'jpy'
        )
        @item.update(soldout: true)
        # @item.soldout = true
        binding.pry
        redirect_to root_path
        flash[:notice] = '商品の購入を完了しました'
      else
        redirect_to root_path
        flash[:notice] = '売り切れました'
      end
    else
      redirect_to root_path
      flash[:notice] = '商品は存在しません'
    end
  end
end
