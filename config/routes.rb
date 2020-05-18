Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/index'
  get 'users/show'
  get 'users/new'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
