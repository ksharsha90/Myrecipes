Rails.application.routes.draw do
  root "pages#home"
  get "pages/home", to: "pages#home"
  
  get '/teams', to: "teams#index"
  get '/teams/new', to: 'teams#new', as: 'new_team'
  get '/teams/:id', to: 'teams#show', as: 'team'
  
end
