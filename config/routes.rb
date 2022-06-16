Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  root to: 'products#home'
  resources :products do
    resources :reviews
  end
end