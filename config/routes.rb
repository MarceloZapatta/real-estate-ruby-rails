Rails.application.routes.draw do
  namespace :api do
    get "users/index"
    get "users/show"
    get "users/store"
    get "users/update"
    get "users/delete"
    get "offices" => "offices#index"
    get "offices/:id" => "offices#show"
    put "offices/:id" => "offices#update"
    post "offices" => "offices#store"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "offices#index"
end
