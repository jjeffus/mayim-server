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

  resources :conversations, only: [:index, :create]
  resources :messages, only: [:create]

  mount ActionCable.server => '/cable'
  get 'home', to: 'pages#home'
  root 'pages#home'
end
