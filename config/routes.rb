Rails.application.routes.draw do

  root 'main#index'
  match "/404" => "errors#error404", via: [:get, :post]
  
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users
  
  resources :messages
  
  # resources :projects
  # resources :pages
  # resources :models
  # resources :galleries
  # resources :contents
  # resources :products
  # resources :sliders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
