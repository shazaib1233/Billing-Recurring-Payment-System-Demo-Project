Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'users/invitations' }

  namespace :buyer do
    resources :subscriptions
    resources :users
  end

  namespace :admin do
    resources :users
    resources :plans
  end

  root 'home#index'
end
