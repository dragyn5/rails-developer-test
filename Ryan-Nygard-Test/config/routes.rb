Rails.application.routes.draw do

  get 'pages/home'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :articles
  resources :categories
  resources :users
  root 'pages#home'

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  resources :user, :controller => "user"
  root :to => "dashboard#index"
end


