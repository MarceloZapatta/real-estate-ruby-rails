Rails.application.routes.draw do
  namespace :api do
    post "login" => "authentication#login"

    get "users" => "users#index"
    get "users/:id" => "users#show"
    put "users/:id" => "users#update"
    delete "users/:id" => "users#destroy"
    post "users" => "users#store"

    get "offices" => "offices#index"
    get "offices/:id" => "offices#show"
    put "offices/:id" => "offices#update"
    delete "offices/:id" => "offices#destroy"
    post "offices" => "offices#store"

    post "offices/:id/user/:userId" => "office_users#store"
    delete "offices/:id/user/:userId" => "office_users#destroy"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "offices#index"
end
