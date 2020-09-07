Rails.application.routes.draw do
  namespace :tradein do
    resources :cars
  end
  namespace :tradein do
    get 'main/index'
  end
  namespace :service do
    resources :reviews
  end
  namespace :service do
    resources :sales
  end
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  
  root 'main#index'
  
  get  'main/index'
  get  'modification_images/show'
  get  'maps', to: 'main#index'

  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  
  resources :messages
  resources :pages, only: [:show]
  resources :complectations, only: [:show]

  resources :models do
    resources :modifications
  end
  resources :modification_images, only: [:image] do
    collection do
      post :image
    end
  end
  resources :parsers do
    collection do
      post :model
      post :complectation
      post :modification_image
      post :instock_price
      post :tth
    end
  end

  resources :cars, only: [:show, :index]

  namespace :service do
    root 'main#index'
    get 'main/index'

    resources :jobs do
      resources :works
    end
    resources :works
  end
  
  # resources :engines
  # resources :specifications
  # resources :properties
  # resources :projects
  # resources :galleries
  # resources :contents
  # resources :products
  # resources :sliders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
