Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  root to: 'home#index'

  resources :users, only: [:index] do
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection
  end

  get '/create_trial', to: 'users#create_employees'
  get '/organizations/dashboard', to: 'organizations#dashboard'

  resources :groups, only: [:index, :show] do
    post 'groups/:id/add', to: 'groups#add_employee', as: 'group_add_employee'
    get 'groups/:id/remove/:employee_id', to: 'groups#remove_employee', as: 'group_remove_employee'
  end

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
