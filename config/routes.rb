Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :purrs
  get '/home', to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: "/home"
end
