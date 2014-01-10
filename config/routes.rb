Portfolio::Application.routes.draw do
  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  resources :posts

  # Custom routes for static pages
  get '/about', to: 'home#about'
  get '/about/2', to: 'pages#bio'
  get '/projects', to: 'pages#project'

  root to: 'home#index'

end

