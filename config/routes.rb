Rails.application.routes.draw do
  namespace :api do
    resources :images, only: :update
  end

  root 'images#index'
end
