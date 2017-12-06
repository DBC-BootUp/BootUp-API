Rails.application.routes.draw do
  scope :api do
    resources :users
    resources :interviews
    resources :companies
    resources :skills, only: [:create, :index]
    get '/auth/linkedin/callback', to: 'sessions#login'
    get '/auth/linkedin/logout', to: 'sessions#logout'
  end
end
