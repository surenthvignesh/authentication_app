Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  resource :registration    # handle registring a new user and collecting the new email and password
  resource :session         # login
  resource :password_reset  # for handle forgot password
  resource :password        # handle the password

  # Defines the root path route ("/")
  # root "posts#index"
  root "main#index"
end
