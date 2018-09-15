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

   resources :riders do
    resources :events, only: [:new, :create]
  end

  resources :riders do
    resources :posts, only: [:new, :create]
  end

  resources :posts do
    resources :comments, only:[:new, :create, :destroy]
  end
  resources :posts do
    member {post :like}
  end


  resources :posts, only: [:index, :show, :edit, :update, :destroy]


  resources :albums, only: [:index, :show,:new, :edit, :update, :destroy]

  resources :events, only: [:index, :show, :edit, :update, :destroy]

  get '/pages/videos', to: 'pages#videos'
  get '/pages/events', to: 'pages#events'
  get '/pages/about', to: 'pages#about'
end

