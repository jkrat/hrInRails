Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  root to: 'home#index'

  get '/users/dashboard', to: 'users#dashboard'
  get '/organizations/dashboard', to: 'organizations#dashboard'

  get '/groups', to: 'groups#index'
  get '/groups/:id', to: 'groups#details', as: 'group'
  get 'groups/:id/remove_employee/:employee_id', to: 'groups#remove_employee', as: 'group_remove_employee'
  get 'groups/:id/add_employee/:employee_id', to: 'groups#add_employee', as: 'group_add_employee'

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
