Rails.application.routes.draw do

  resources :places, only: [:show, :edit]

  get 'ratings/index'
  get 'ratings/show'
  get 'ratings/new'
  get 'ratings/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events
  resources :messages, only: [:show]
  resources :imgs, only: [:show]
  resources :users, :tags
  root to: 'pages#home'
  get "/login", to: "sessions#login"
  post "/logged", to: "sessions#logged"
  delete "/logout", to: 'sessions#logout'
  post '/events/:id/attend', to: 'events#attend', as: "events_attend"

  patch '/messages/:id/content', to: 'messages#content', as: "content"
end
