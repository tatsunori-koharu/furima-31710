Rails.application.routes.draw do
  root to: 'kari#index'
  devise_for :users
end
