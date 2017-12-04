Rails.application.routes.draw do
  scope :api do
    root to: 'interviews#index'

    resources :users
    resources :sessions, only: [:new, :create, :delete]

    resources :companies do 
      resources :interviews
    end

    resources :users do 
      resources :interviews
    end
  end
end
