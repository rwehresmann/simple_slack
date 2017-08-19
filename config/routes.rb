Rails.application.routes.draw do
  devise_for :users

  mount ActionCable.server => '/cable'

  root to: 'teams#index'

  resources :teams, only: [:create, :destroy]
  get '/:slug', to: 'teams#show', as: :team_chat

  resources :channels, only: [:show, :create, :destroy]

  resources :talks, only: [:show]

  resources :team_users, only: [:create, :destroy]
end
