Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'home#index'

  resources :searches, :except => [:new, :show, :edit, :update, :destroy]

  resources :schools, :except => [:index, :new, :edit, :update, :destroy] do
    resources :reviews, :except => [:index, :show]
  end

end
