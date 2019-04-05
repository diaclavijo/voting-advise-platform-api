Rails.application.routes.draw do
  resources :answers, only: :create

  resources :polls, only: [:show, :create] do
    resources :questions, only: :index
    resource :result, only: :show
  end
end
