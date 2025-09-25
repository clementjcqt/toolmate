Rails.application.routes.draw do
  authenticated :user do
    root to: 'pages#dashboard', as: :dashboard
  end

  unauthenticated :user do
    root to: 'pages#home', as: :home
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:edit, :update]
end
