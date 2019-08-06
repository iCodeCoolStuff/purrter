Rails.application.routes.draw do
  devise_for :users, :controllers => {registration: "registration"}
  resources :purrs
  #root to: "home#index"
end
