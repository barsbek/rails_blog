Rails.application.routes.draw do
  root "articles#index"
  resources :users
  resources :articles
  get "log_in" => "sessions#new"
  get "log_out" => "sessions#destroy"
  post "log_in" => "sessions#create"
  get "sessions" => "sessions#new"

  namespace :admin do
    root "base#index"
    get "log_out", to: "base#log_out"
    get "log_in", to: "base#log_in"
    post "log_in", to: "base#authenticate"
  end
end
