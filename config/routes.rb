Rails.application.routes.draw do
  root "pages#home"
  get "pages/home", to: "pages#home"
  
  get '/teams', to: "teams#index"
end
