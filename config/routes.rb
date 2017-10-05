Rails.application.routes.draw do
  resources :currencies, only: [:index, :show, :create]
  root "roots#index"
end
