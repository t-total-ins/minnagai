Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :accounts

  resources :projects, only: [ :index, :new, :create, :show ] do
  	resources :joins, only: [ :new, :create, :edit, :update, :destroy ]
    resources :questions, only: [ :new, :create ]
    get 'purchases/detail'
    get 'purchases/confirm'
    post 'purchases/complete'
  end

  resources :users, only: [ :new, :create, :edit, :update ]
  resources :notices, only: [ :show ]

  get 'pages/about'
  get 'pages/contact'
  get 'pages/guide'
  get 'pages/faq'
  get 'pages/term'
  get 'pages/privacy'
  get 'pages/legal'

  get 'accounts/show'
  get 'accounts/now'
  get 'accounts/before'
  get 'accounts/result'

  root to: 'pages#home'

  match '*path' => 'application#error404', via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
