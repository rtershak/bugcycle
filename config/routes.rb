Rails.application.routes.draw do
  root to: 'bicycles#index'

  devise_for :users

  namespace :users do
    resources :bicycles, only: %i(index new edit)
  end

  resources :bicycles do
    post :use, on: :member
  end
end
