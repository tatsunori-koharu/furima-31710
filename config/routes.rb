Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :items, only: [:new, :create, :show] do
    resources :orders, only: [:index, :create]
  end
end
