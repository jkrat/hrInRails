Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  root 'home#index', as: 'home_index'

  resources :organizations
  resources :users
  resources :employees
  resources :transactions do
    get :void, on: :member
  end

  namespace :admin do
    resources :organizations
    resources :users

    root to: 'organizations#index'
  end
end
