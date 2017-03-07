Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root 'searches#index'

  resources :searches, :except => [:show, :edit, :update, :destroy]
  resources :schools, :except => [:index, :edit, :update, :destroy]

  resources :users do
    resources :reviews, :only => [:index, :show]
  end

  resources :schools do
    resources :reviews, :except => [:index, :show]
  end

end
