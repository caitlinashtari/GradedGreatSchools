Rails.application.routes.draw do

  resources :searches
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root 'searches#index'

  resources :users do
    resources :reviews
  end

  resources :schools
end
