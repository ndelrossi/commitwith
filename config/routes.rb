Rails.application.routes.draw do
  root 'home#index'

  resources :home, only: [:index]
  resources :projects, only: [:index, :create, :update]

  get 'projects/activate/:id' => 'projects#activate',     as: 'project_activate'
  get 'projects/delete/:id' => 'projects#destroy',     as: 'project_remove'
  
  get '*any' => 'home#index'
end
