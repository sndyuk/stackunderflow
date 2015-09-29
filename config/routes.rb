Rails.application.routes.draw do
  root 'questions#index'

  devise_for :users
  resources :images
  resources :answers
  resources :comments
  resources :questions
end