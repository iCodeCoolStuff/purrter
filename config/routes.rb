Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :purrs
  #root to: "home#index"
end
