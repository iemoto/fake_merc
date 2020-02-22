Rails.application.routes.draw do
  root "mains#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
    }
  
  devise_scope :user do
    get '/signup', to: 'users/registrations#index'
    get '/signup/registration', to: 'users/registrations#new'
    post '/signup/registration', to: 'users/registrations#create'
    # get '/signup/registration/:id', to: 'users/registrations#show'
  end

  # メイン画面、商品詳細画面
  get '/', to: 'mains#index'
  get '/:id/show', to: 'mains#show'

  # マイページトップページ、本人情報登録画面
  get '/mypage', to: 'users#index'
  get '/mypage/identification', to: 'users#edit'
  patch '/mypage/identification', to: 'users#update'

  # マイページ（ログアウト）
  get '/logout', to: 'users#show'

  # マイページ編集画面
  get '/mypage/profile', to: 'profiles#edit'
  patch '/mypage/profile', to: 'profiles#update'

  # 決済機能実装時にコントローラー等を作成
  # get '/mypage/card', to: ''

  # 発送元・お届け先住所画面
  # 登録画面が不明のため、適当に/registを付けています
  get '/mypage/deliver_address/regist', to: 'deliver_addresses#new'
  post '/mypage/deliver_address/regist', to: 'deliver_addresses#create'
  get '/mypage/deliver_address', to: 'deliver_addresses#edit'
  patch '/mypage/deliver_address', to: 'deliver_addresses#update'

  # 商品出品、商品詳細、商品編集、商品削除
  get '/sell', to: 'sell_items#new'
  put '/sell', to: 'sell_items#create'
  get '/transaction/buy/:id', to: 'sell_items#show'
  get '/sell/edit/:id', to: 'sell_items#edit'
  patch '/sell/edit/:id', to: 'sell_items#update'
  delete '/sell/edit/:id', to: 'sell_items#destroy'

  # 商品編集・削除を選択できるページ(show)
  get '/mypage/listings/listing', to: 'items#index'
  get '/mypage/items/:id', to: 'items#show'
end
