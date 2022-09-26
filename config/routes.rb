Rails.application.routes.draw do
  resources :subscriptions
  resources :features
  resources :plans
  devise_for :users, controllers: { invitations: 'users/invitations' }

  namespace :buyer do
    resources :users
  end

  namespace :admin do
    resources :users
  end

  root 'home#index'
end
