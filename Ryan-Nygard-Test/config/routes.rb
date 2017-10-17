Rails.application.routes.draw do

  get 'pages/home'

  devise_for :users
  resources :articles
  resources :categories

  root 'pages#home'
end
