Rails.application.routes.draw do
  namespace :api do
    resources :images, only: :update
  end

  resources :folders

  resources :notes do
    collection do
      patch 'reorder'
    end
  end

  root 'images#index'
end
