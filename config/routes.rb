Rails.application.routes.draw do
  root 'home#index'

  resources :home, only: [:index]
  resources :projects, only: [:index, :show, :create, :update, :destroy]
  
  get '*any' => 'home#index'
end
