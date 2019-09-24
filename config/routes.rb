Rails.application.routes.draw do
  resources :transactions
  resources :employees
  root 'home#index', as: 'home_index'
end
