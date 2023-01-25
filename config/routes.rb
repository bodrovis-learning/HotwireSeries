# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :images, only: :update
  end

  resources :folders do
    resources :bookmarks
  end

  resources :notes do
    collection do
      patch 'reorder'
    end
  end

  resources :rooms, only: %i[index show]

  resources :messages, only: %i[create]

  root 'images#index'
end
