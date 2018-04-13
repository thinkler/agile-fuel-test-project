Rails.application.routes.draw do
  root 'rewards#index'

  devise_for :users

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :rewards, only: [:index, :show]
    end
  end

  resources :rewards, only: [:index]
end
