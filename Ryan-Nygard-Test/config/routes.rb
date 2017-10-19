Rails.application.routes.draw do

  get 'pages/home'

  devise_for :users
  resources :articles
  resources :categories
  resources :users
  root 'pages#home'
end
