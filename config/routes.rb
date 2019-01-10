# frozen_string_literal: true

Rails.application.routes.draw do
  # Specific Pages
  root 'recipes#index'

  resources :measurements
  resources :ingredients
  resources :techniques
  resources :recipe_steps
  resources :recipes

  # Authentication via Divise routes
  devise_for :users, controllers: { registrations: 'registrations' }


  get 'contact',
      to: 'pages#contact',
      as: :contact

  # Resources
  resources :ajax_modal

  # Custom Error Routes
  match '/404',
        to: 'errors#not_found',
        via: :all
  match '/500',
        to: 'errors#internal_server_error',
        via: :all
end
