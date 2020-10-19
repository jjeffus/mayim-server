Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }

  namespace :api do
    namespace :v1 do
      resources :users
      resources :conversations, only: [:index, :create]
      resources :messages, only: [:create]
    end
  end

  mount ActionCable.server, at: '/cable'
  get 'signin', to: 'pages#signin'
  get 'register', to: 'pages#register'
  root 'pages#signin'
end
