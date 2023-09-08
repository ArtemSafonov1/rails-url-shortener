# frozen_string_literal: true

Rails.application.routes.draw do
  resources :links, except: %i[show edit update], param: :short_url do
    get 's/:short_url', to: 'links#show', on: :collection, as: :short
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
