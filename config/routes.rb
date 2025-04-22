Rails.application.routes.draw do
  get "habits/new"
  get "habits/create"
  get "profiles/show"
  get "registrations/new"
  get "sessions/new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root "index#index"

  # Routes for login/logout
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # Routes for registration
  get "/register", to: "registrations#new"
  post "/register", to: "registrations#create"

  # Profile route
  get "/profile", to: "profiles#show"
  post "/profile", to: "profiles#update"
  patch "/profile", to: "profiles#update"
  profile_path = "/profile"

  # Habit routes
  post "/habits/new", to: "habits#new", as: :new_habit
  post "/habits", to: "habits#create"
  new_habit_path = "/habits/new"
  post "/track_habit", to: "habits#track"
  post "/untrack_habit", to: "habits#untrack"

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
