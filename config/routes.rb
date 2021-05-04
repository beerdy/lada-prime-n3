Rails.application.routes.draw do
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  
  root 'main#index'
  
  get 'main/index'
  get 'modification_images/show'
  get 'maps', to: 'main#index'
  get 'qwiz/index'

  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  
  resources :messages
  resources :pages, only: [:show]
  resources :complectations, only: [:show]
  resources :specials
  resources :actions

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
      post :tth
      post :model
      post :complectation
      post :modification_image
      post :instock_price
    end
  end

  namespace :tradein do
    resources :car_images
  end

  namespace :service do
    root 'main#index'
    get 'main/index'

    resources :jobs do
      resources :works
    end
    resources :works
    resources :sales
    resources :reviews
    resources :sliders
    resources :writes
    resources :whatwedos
  end

  namespace :tradein do
    root 'main#index'
    get 'main/index'
    
    resources :cars
    resources :parsers
  end

  # resources :engines
  # resources :specifications
  # resources :properties
  # resources :projects
  # resources :galleries
  # resources :contents
  # resources :products
  # resources :sliders
  # resources :cars, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ЗаглушкИ для несуществующих routes. К примеру картинок подгружаемых библиотеками JS
  get '/galleries/original/missing.png', controller: 'main',  action: 'missing', :defaults => { :format => 'json' } 
  get '/images/original/missing.png', controller: 'main',  action: 'missing', :defaults => { :format => 'json' } 
  get '/previews/original/missing.png', controller: 'main',  action: 'missing', :defaults => { :format => 'json' } 
end
