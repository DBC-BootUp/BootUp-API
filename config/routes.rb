Rails.application.routes.draw do
  scope :api do
    root to: 'interviews#index'

    resources :users
    resources :sessions, only: [:new, :create, :delete]

    resources :companies do 
      resources :skills, only: [:index, :new, :create]
      resources :interviews
    end

    resources :users do 
      resources :skills, only: [:index, :new, :create]
      resources :interviews
    end

    resources :interviews do
      resources :skills, only: [:index, :new, :create]
    end
  end
end
