Rails.application.routes.draw do
  get     '/home',     to: 'static_pages#home'
  get     '/login',    to: 'sessions#new'
  post    '/login',    to: 'sessions#create'
  delete  '/logout',   to: 'sessions#destroy'
  get     '/signup',   to: 'users#new'
  root    'sessions#new'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :followings,       only: [:create, :destroy]
  resources :thoughts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
