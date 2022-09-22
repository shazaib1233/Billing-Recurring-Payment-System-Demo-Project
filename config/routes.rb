Rails.application.routes.draw do
  get 'home/index'
  # devise_for :users
  root 'home#index'
  devise_for :users, controllers: { invitations: 'users/invitations' }


  namespace :buyer do
    resources :users
  end

      # devise_for :users, controllers: {
      #   sessions: 'users/sessions'
      # }
end
