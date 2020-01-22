Rails.application.routes.draw do
  # root 'tests#index'
  ## リンク作成後、以下みたいに修正
  # get '/mypage', to: 'users#index'
  root 'users#index'
end
