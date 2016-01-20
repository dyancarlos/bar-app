Rails.application.routes.draw do
  root 'tables#index'

  resources :categories
  resources :products
  resources :tables
  resources :summaries
  resources :admin
  resources :flavors

  resources :orders do
    collection do
      get :add
      post :add_from_form
      get :remove
      get :pay
    end
  end
end
