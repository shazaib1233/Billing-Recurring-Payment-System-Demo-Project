Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'users/invitations' }

  namespace :buyer do
    resources :subscriptions
    resources :plans
    resources :bills do
      member do
        patch :pay_bill
      end
    end
    resources :subscription_features do
      collection do
        patch :increment_consumed
      end
    end
  end

  namespace :admin do
    resources :users
    resources :plans
    resources :features
    resources :usage
    resources :payments
  end

  namespace :api do
    namespace :v1 do
      devise_scope :user do
         post 'signup' => 'registrations#create'
         post 'signin' => 'sessions#create'
         delete 'signout' => 'sessions#destroy'
      end
      get 'plans' => 'plans#index'
      get 'my_plans' => 'plans#my_plans'
      delete 'unsubscribe' => 'subscriptions#destroy'
      post 'subscribe' => 'subscriptions#create'
    end
  end

  root 'home#index'
end
