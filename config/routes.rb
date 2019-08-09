# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get '/home', to: 'statics#home'

  resources :items, only: [:index, :show]
  resources :carts, only: [:show, :update]

  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
