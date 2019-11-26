Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  root to: 'home#index'

  get '/users/dashboard', to: 'users#dashboard'
  get '/organizations/dashboard', to: 'organizations#dashboard'

  resources :employees
  resources :transactions do
    get :void, on: :member
  end

  namespace :admin do
    root to: 'organizations#index'
    resources :organizations
    resources :users
  end
end
