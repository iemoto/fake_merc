Rails.application.routes.draw do
  root "top_pages#index"
  devise_for :users
  resources :users, only: [:index, :destroy]

  get '/mypage', to: 'users#index'
end
