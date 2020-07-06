Rails.application.routes.draw do
  resources :properties
  resources :complectations
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  
  root 'main#index'
  get  'main/index'
  get  'maps', to: 'main#index'

  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  
  resources :messages
  resources :pages, only: [:show]
  
  resources :cars, only: [:show, :index]

  # resources :projects
  # resources :models
  # resources :galleries
  # resources :contents
  # resources :products
  # resources :sliders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
