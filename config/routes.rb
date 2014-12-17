Rails.application.routes.draw do

  root 'pages#home'

  resources :projects, only: [:show]
end
