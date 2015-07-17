Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :items, only: [:index, :show, :create, :new]

  resources :tracked_items

  namespace :admin do
    resources :users, only: [:index, :destroy, :create, :new]
    resources :items, only: [:index, :destroy]
  end

end
