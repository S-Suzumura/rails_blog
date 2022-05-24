Rails.application.routes.draw do
  root "articles#index"
  post "/articles/like",to:"articles#like"
  get  "/users/new",to:"users#new"
  resources :articles do
    resources :comments
  end
end