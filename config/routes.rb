Rails.application.routes.draw do
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  
  root 'main#index'
  
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  
  resources :messages
  resources :pages, only: [:show]
  # resources :projects
  # resources :models
  # resources :galleries
  # resources :contents
  # resources :products
  # resources :sliders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
