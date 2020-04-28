Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources  :books
  root "top#start"
  get "home/about" => "top#about"
  resources :users, only: [:show, :edit, :update, :index] 
  	#resource :books, only: [:show, :edit, :update, :destroy]
  
  post 'users/:id/books' => 'books#create'
  




end
