# frozen_string_literal: true

Rails.application.routes.draw do
  resources :locations, only: %i[index show create]
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'areas#index'

  get '/inside', to: 'geocode#index'
end
