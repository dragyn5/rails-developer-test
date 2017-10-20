Rails.application.routes.draw do

  get 'pages/home'
  devise_for :users, :path_prefix => 'my', :controllers => { registrations: 'registrations' }
  resources :articles
  resources :categories
  resources :users
  root 'pages#home'
end
