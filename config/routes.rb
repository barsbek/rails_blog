Rails.application.routes.draw do
  root "articles#index"
  resources :articles
  get :log_in, to: "sessions#log_in"
  post :log_in, to: "sessions#authenticate"
  get :log_out, to: "sessions#log_out"
  # TODO change actions names 
  # TODO DRY

  resources :users, except: [:index]

  namespace :admin do 
    root "base#index"
    get "log_in", to: "base#log_in"
    post "log_in", to: "base#authenticate"
    get "log_out", to: "base#log_out"
    resources :users, only: [:index, :destroy]
  end
end
