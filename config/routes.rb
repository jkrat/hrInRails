Rails.application.routes.draw do
  resources :organizations
  resources :users
  devise_for :employees
  root 'home#index', as: 'home_index'
  resources :transactions do
    get :void, on: :member
  end
  resources :employees
end
