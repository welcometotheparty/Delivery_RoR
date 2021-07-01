Rails.application.routes.draw do
  get 'homepage/home'
  root 'homepage#home'
  devise_for :clients
  resources :packages
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
