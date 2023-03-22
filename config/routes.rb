Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'

  resources :posts
get 'posts', to: 'posts#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

   end

