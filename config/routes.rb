Rails.application.routes.draw do
  root "pages#home"
  get "pages/home", to: "pages#home"
  
  resources :teams
  
  get '/signup', to: 'rowdies#new'
  resources :rowdies, except: [:new]
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
end
