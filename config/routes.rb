Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  root to: 'home#index'

  resources :users, only: [:index] do
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection
  end

  get '/organizations/dashboard', to: 'organizations#dashboard'

  get '/groups', to: 'groups#index'
  get '/groups/:id', to: 'groups#details', as: 'group'
  get 'groups/:id/remove_employee/:employee_id', to: 'groups#remove_employee', as: 'group_remove_employee'
  post 'groups/:id/add_employee', to: 'groups#add_employee', as: 'group_add_employee'

  resources :employees
  resources :transactions do
    get :void, on: :member
  end

  namespace :admin do
    root to: 'organizations#index'
    resources :organizations
    resources :users
  end

  mount PgHero::Engine, at: "pghero"

end
