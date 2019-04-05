Rails.application.routes.draw do
  resources :polls, only: [:show, :create] do
    resources :questions, only: :index
    resources :answers, only: :create
    resource :result, only: :show
  end
end
