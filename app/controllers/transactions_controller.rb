class TransactionsController < ApplicationController
  require 'payjp'
  def buy
    Payjp.api_key='sk_test_6ac86173c744a32d7dbde20a'
    Payjp::Charge.create(
      # 決済する金額
      amount: 121212,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end
end