# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dashboard' => 'dashboard#show'
  get 'logout' => 'logout#logout'

  root 'home#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
end
