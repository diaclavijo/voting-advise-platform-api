Rails.application.routes.draw do
  resources :questions, only: :index, format: :js
  resources :answers, only: :create
  resource :result, only: :show
end
