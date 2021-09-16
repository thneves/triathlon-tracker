# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :tracks, only: %i[index create]
      resources :sessions, only: [:create]
      resources :registrations, only: [:create]
      delete :logout, to: 'sessions#logout'
    end
  end
  root to: 'static#home'
end
