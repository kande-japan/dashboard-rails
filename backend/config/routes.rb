Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  post '/', to: 'slacks#receiver'

  # root "articles#index"

  namespace :api do
    namespace :v1 do
      post 'token', to: 'sessions#session'
      post 'token/refresh', to: 'sessions#refresh'
      resources :users, only: %i[index create]
    end
  end
end
