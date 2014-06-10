Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  root to: 'welcome#index'
  get '/contact', to: "welcome#contact"

  resources :posts do
    resources :comments, shallow: true
  end

  resources :projects do
    resources :comments, shallow: true
  end

  concern :commentable do
    resources :comments
  end

  resources :posts, concerns: :commentable
  resources :projects, concerns: :commentable
  resources :contacts, only: [:new, :create]

end
