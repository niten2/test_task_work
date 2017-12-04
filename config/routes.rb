Rails.application.routes.draw do
  devise_for :users

  resources :favorites, only: [:index, :create, :destroy]
  resources :companies, only: [:index, :show]

  root to: 'companies#index'
end
