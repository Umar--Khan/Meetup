Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events
  resources :users, :tags
  root to: 'pages#home'
  get "/login", to: "sessions#login"
  post "/loggedin", to: "sessions#loggedin"
  delete "/logout", to: 'sessions#logout'
end
