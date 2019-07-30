# frozen_string_literal: true

Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
  root 'statics#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
