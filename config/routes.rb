Portfolio::Application.routes.draw do
  devise_for :users
  resources :posts

  get '/about', to: 'home#about'
  get '/about/2', to: 'pages#bio'

  root to: 'home#index'

end
