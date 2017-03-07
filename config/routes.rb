Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root 'home#index'

  resources :searches, :except => [:new, :show, :edit, :update, :destroy]

  resources :users do
    resources :reviews, :only => [:index, :show]
  end

  resources :schools, :except => [:index, :new, :edit, :update, :destroy] do
    resources :reviews, :except => [:index, :show]
  end

end
