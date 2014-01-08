Portfolio::Application.routes.draw do
  devise_for :users
  resources :posts

  get '/about', to: 'home#about'

  root to: 'home#index'

end
