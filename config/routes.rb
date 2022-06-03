Rails.application.routes.draw do
  devise_for :accounts
  root "articles#index"
  post "/articles/like",to:"articles#like"
  resources :articles do
    resources :comments
  end
end