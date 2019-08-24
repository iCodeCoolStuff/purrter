Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users, only: [:show]
  resources :purrs
  resources :relationships, only: [:create, :destroy]
  get '/home', to: 'pages#home'
  get '/explore', to: 'pages#explore'
  root "pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: "/home"
end
