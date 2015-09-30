Rails.application.routes.draw do
  root 'questions#index'

  devise_for :users

  resource :image do
    member do
      get 'cached_image_url'
    end
  end
  resources :answers
  resources :comments
  resources :questions
  resources :users, only: [:index, :show]
end