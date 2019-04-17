Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events
  resources :messages, only: [:show]
  resources :users, :tags
  root to: 'pages#home'
  get "/login", to: "sessions#login"
  post "/logged", to: "sessions#logged"
  delete "/logout", to: 'sessions#logout'
end
