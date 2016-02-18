Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  
  resources :posts
  resources :projects
  resources :contacts, only: [:new, :create]
end
