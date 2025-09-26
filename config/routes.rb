Rails.application.routes.draw do
  # Redirect to dashboard if user is logged in
  authenticated :user do
    root to: 'pages#dashboard', as: :dashboard
  end

  # Redirect to landing page if user not logged in yet
  unauthenticated :user do
    root to: 'pages#home', as: :home
  end

  # Generate all the routes needed for Devise authentication for the User model
  # and use custom controller registration for editing profile after sign up
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users, only: [:edit, :update]
  resources :tools
end
