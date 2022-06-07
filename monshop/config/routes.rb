Rails.application.routes.draw do
  resources :items
  root to: 'items#index'

  get '/login', to: 'auth#form_login', as: 'form_login'
  post '/login', to: 'auth#login', as: 'login_post'

  # logout
  delete '/logout/:id', to: 'auth#logout', as: 'user_logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end