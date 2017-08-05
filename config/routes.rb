Rails.application.routes.draw do
  get 'suggestions/new'

  get 'suggestions/create'

  root to: 'bicycles#index'

  devise_for :users

  namespace :users do
    resources :bicycles, only: %i(index new edit)
  end

  resources :bicycles do
    post :use, on: :member

    resources :suggestions
  end

end
