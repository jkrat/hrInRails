Rails.application.routes.draw do
  root 'home#index', as: 'home_index'
  resources :transactions
  resources :employees
end
