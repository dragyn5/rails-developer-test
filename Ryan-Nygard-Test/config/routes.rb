Rails.application.routes.draw do
  get 'pages/home'

  devise_for :users
  resources :articles

  root 'pages#home'
end
