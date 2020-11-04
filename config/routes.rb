Rails.application.routes.draw do
  get 'charges/new'
  devise_for :users
  resources :users
  resources :events
  resources :charges
  root 'events#index'
  get 'events/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
