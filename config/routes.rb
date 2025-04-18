Rails.application.routes.draw do

  devise_for :users
  root to: "homes#index"
  resources :lessons, only: [:index, :new, :create, :edit, :update]
end
