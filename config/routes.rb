Rails.application.routes.draw do
  devise_for :accounts
  root "articles#index"
  post "/articles/like",to:"articles#like"
  delete "/articles/unlike",to:"articles#unlike"
  resources :articles do
    resources :comments
  end
end