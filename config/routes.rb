Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount Attachinary::Engine => "/attachinary"

  devise_for :users,  :controllers => { registrations: "registrations"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :riders

  resources :riders do
    resources :albums, only: [:new, :create]
  end

  resources :albums, only: [:index, :show, :edit, :update, :destroy]

  get '/pages/videos', to: 'pages#videos'
  get '/pages/events', to: 'pages#events'
  get '/pages/about', to: 'pages#about'



end

