Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  get '/', to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :purrs
  #root to: "home#index"
end
