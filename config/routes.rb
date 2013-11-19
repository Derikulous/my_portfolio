Portfolio::Application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations",
                                   passwords: "users/passwords",
                                   omniauth_callbacks: "omniauth_callbacks"}
  resources :projects
  root to: 'home#index'

end
