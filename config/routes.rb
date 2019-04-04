Rails.application.routes.draw do
  resources :questions, only: :index, format: :js
end
