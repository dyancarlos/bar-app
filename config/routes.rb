Rails.application.routes.draw do
  root 'tables#index'

  resources :categories
  resources :products
  resources :tables
  resources :summaries

  resources :orders do
    collection do
      get :add
      get :remove
      get :pay
    end
  end
end
