Portfolio::Application.routes.draw do
  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

  resources :posts

  # Custom routes for static pages
  get '/about', to: 'pages#about'
  get '/about/2', to: 'pages#bio'
  get '/projects', to: 'pages#projects'
  get '/projects/officehours', to: 'pages#projects_2'
  get '/projects/yolo', to: 'pages#projects_3'
  get '/projects/portfolio', to: 'pages#projects_4'

  root to: 'home#index'

end

