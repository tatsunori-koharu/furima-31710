Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :orders, only: [:index, :create]
  end
end
