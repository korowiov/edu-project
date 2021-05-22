Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  scope :api do
    scope :v1 do
      mount_devise_token_auth_for 'Account', at: 'auth'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :subjects, only: [:index]
    end
  end
end
