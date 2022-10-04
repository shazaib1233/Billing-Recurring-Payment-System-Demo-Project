Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'users/invitations' }

  namespace :buyer do
    resources :subscriptions do
      member do
        patch :increment_consumed
      end
    end
    resources :plans
  end

  namespace :admin do
    resources :users
    resources :plans
    resources :features
    resources :usage
    resources :payments
  end

  root 'home#index'
end
