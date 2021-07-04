Rails.application.routes.draw do
  get 'homepage/home'
  get 'homepage/admin_home'
  get '/search' => 'homepage#search', :as => 'search_page'
  root 'homepage#home'
  devise_for :clients
  resources :packages
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
