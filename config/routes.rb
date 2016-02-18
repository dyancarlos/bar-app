Rails.application.routes.draw do
  root 'tables#index'

  resources :categories
  resources :tables
  resources :summaries
  resources :admin
  resources :flavors

  resources :products do
    collection do
      get :options
    end
  end

  resources :orders do
    collection do
      post :add_other
      post :add_pizza
      get :remove
      get :pay
    end
  end
end
