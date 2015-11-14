Rails.application.routes.draw do
  # root 'welcome#index'

  resources :categories
  resources :products

  resources :orders do
    collection do
      get :add
    end
  end
end
