Rails.application.routes.draw do
  # get 'items/index'
  # get 'furimas/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :new, :create]
  end
  # root "orders#index"
  # resources :orders, only: [:index, :new]
end
