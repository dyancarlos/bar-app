Rails.application.routes.draw do
  root 'tables#index'

  resources :categories
  resources :products
  resources :tables

  resources :orders do
    collection do
      get :add
      get :remove
    end
  end
end
