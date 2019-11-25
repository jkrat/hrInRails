Rails.application.routes.draw do
  root 'home#index', as: 'home_index'
  resources :transactions do
    get :void, on: :member
  end
  resources :employees
end
