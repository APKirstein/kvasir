Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :jita

  resources :items, only: [:index, :create, :new]
  resources :tracked_items, only: [:index, :destroy]
  resources :tracked_items, only: [:new, :create], defaults: { format: 'json' }

  namespace :admin do
    resources :users
    resources :items, only: [:index, :destroy]
  end

end
