Rails.application.routes.draw do
  devise_for :users
  root to: 'bicycles#index'

  resources :bicycles
end
