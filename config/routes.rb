Portfolio::Application.routes.draw do
  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

  resources :posts

  # Custom routes for static pages
  get '/logout', to: 'pages#signout'
  get '/about', to: 'pages#about'
  # get '/about/2', to: 'pages#bio'
  # get '/projects', to: 'pages#projects'
  # get '/projects/officehours', to: 'pages#projects_2'
  # get '/projects/yolo', to: 'pages#projects_3'
  # get '/projects/portfolio', to: 'pages#projects_4'
  # get '/projects/stake', to: 'pages#projects_5'
  get '/photos', to: 'pages#photos'
  # get '/photos/2', to: 'pages#photos_2'

  root to: 'home#index'

end
