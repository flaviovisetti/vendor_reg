Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :vendors, only: [:new, :create, :show, :edit, :update]
end
