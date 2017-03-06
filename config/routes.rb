Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root 'searches#index'

  resources :searches
  resources :schools

  resources :users do
    resources :reviews
  end

end
