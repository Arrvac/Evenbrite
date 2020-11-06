Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :events
  resources :charges
  resources :attendances
  resources :events do
  	resources :attendances, only: [:new, :create]
  end
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  root 'events#index'
  get 'events/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
