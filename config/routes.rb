Portfolio::Application.routes.draw do

  devise_for :users

  resources :posts do
    resources :comments
  end

  resources :projects
  root to: 'home#index'

end
