class TransactionsController < ApplicationController
  def buy
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      # 決済する金額
      amount: 1211,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end
end