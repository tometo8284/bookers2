Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
