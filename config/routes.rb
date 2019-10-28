Rails.application.routes.draw do
  resources :time_cards
  root 'home#index', as: 'home_index'
  resources :transactions do
    get :void, on: :member
  end
  resources :employees
  resources :time_cards do
    get :add, on: :member
  end
end
