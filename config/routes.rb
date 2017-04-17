Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root 'home#index'

  resources :searches, :except => [:new, :show, :edit, :update, :destroy]

  resources :schools, :except => [:new, :edit, :update, :destroy] do
    resources :teachers
  end

end
