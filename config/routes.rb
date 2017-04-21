Rails.application.routes.draw do

  resources :users
  root 'sessions#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'modules' => "modulecourses#index"
  get 'addmodtostudent' => "modulecourses#addmodtostudent"
  get 'withdrawmodulestudent' => "modulecourses#withdrawmodulestudent"
  get 'search_by_student_number' => "students#search_by_student_number"
  get 'search_by_student_name' => "students#search_by_student_name"
  get 'addmodtolecturer' => "modulecourses#addmodtolecturer"
end
