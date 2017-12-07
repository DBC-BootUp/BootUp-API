Rails.application.routes.draw do
  scope :api do
    resources :users
    resources :interviews
    resources :companies
    resources :skills, only: [:create, :index]
    get '/auth/linkedin/callback', to: 'sessions#login'
    get '/logout', to: 'sessions#logout'
    resources :searches
    get '/profile', to: 'users#profile'
  end
end
