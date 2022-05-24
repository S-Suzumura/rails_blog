Rails.application.routes.draw do
  root "articles#index"
  post "/articles/like",to:"articles#like"

  resources :articles do
    resources :comments
  end
end