require 'sidekiq/web'

Rails.application.routes.draw do
  get 'homepage/home'
  get 'homepage/admin_home'
  get '/search' => 'homepage#search', :as => 'search_page'
  post 'homepage/csv_export'
  root 'homepage#home'
  devise_for :clients
  resources :packages, except: [:index]
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :pages, only: [] do
    get 'home', on: :collection
  end

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
