Rails.application.routes.draw do
  root 'application#index'

  resources :application, only: [:index]
  resources :projects, only: [:index, :create, :update, :destroy]
  
  get '*any' => 'application#index'
end
