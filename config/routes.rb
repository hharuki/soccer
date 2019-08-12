Rails.application.routes.draw do
  get 'topics/new'
  get 'favorites/new'
  

  get 'sessions/new'
  root 'pages#index'
  get 'pages/index'
  
  
  get'/login', to: 'sessions#new'
  post'/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  delete '/topics', to: 'topics#destroy'
  delete '/comments', to: 'comments#destroy'
  
  resources :users
  resources :topics
  resources :favorites
  resources :comments
end
  