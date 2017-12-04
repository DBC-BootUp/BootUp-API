Rails.application.routes.draw do
  scope :api do
    resources :users
    resources :interviews
    resources :companies
    resources :skills, only: [:create, :index]
  end
end
