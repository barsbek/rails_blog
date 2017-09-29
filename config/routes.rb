Rails.application.routes.draw do
  resources :users
  resources :articles
  get "log_in" => "sessions#new"
  get "log_out" => "sessions#destroy"
  post "sessions" => "sessions#create"
  get "sessions" => "sessions#new"
end
