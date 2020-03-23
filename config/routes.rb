Rails.application.routes.draw do
  get '/aws', to: 'aws_texts#index'
  get '/aws/:id', to: 'aws_texts#show', as: 'aws_text'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users

  get 'movies/index'
  root to: 'movies#index'
end
