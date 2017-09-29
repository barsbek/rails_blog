Rails.application.routes.draw do
  resources :users
  resources :articles
  get "log_in" => "sessions#new"
  get "log_out" => "sessions#destroy"
  post "log_in" => "sessions#create"
  get "sessions" => "sessions#new"
end
