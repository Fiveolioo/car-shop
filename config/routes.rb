Rails.application.routes.draw do
  root 'users#show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:show] do
    resources :cars
end

  resources :users, only: [:show] do
    resources :appointments
end

  resources :shops
end
