Rails.application.routes.draw do
  get 'top_pages/index'
  root "top_pages#index"
end
