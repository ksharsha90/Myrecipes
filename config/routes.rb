Rails.application.routes.draw do
  root "pages#home"
  get "pages/home", to: "pages#home"
  
  resources :teams
  
  get '/signup', to: 'rowdies#new'
  resources :rowdies, except: [:new]
  
end
