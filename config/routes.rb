Rails.application.routes.draw do

  resources :users
  root 'sessions#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'modules' => "modulecourses#index"
end
