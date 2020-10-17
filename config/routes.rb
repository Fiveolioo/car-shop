Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#show'
  resources :users, only: [:show] do
    resources :cars
end

  resources :users, only: [:show] do
    resources :appointments
end

  resources :shops
end
