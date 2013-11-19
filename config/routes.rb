Portfolio::Application.routes.draw do
  scope ":locale" do
    devise_for :users, controllers: {registrations: "users/registrations",
                                     passwords: "users/passwords",
                                     omniauth_callbacks: "omniauth_callbacks"}

    resources :posts do
      resources :comments
    end

    resources :projects do
      resources :comments
    end

    resources :comments
  end

  root to: 'home#index'

end
