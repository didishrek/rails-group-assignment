Rails.application.routes.draw do
  resources :users
  root 'sessions#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  resources :users
end
