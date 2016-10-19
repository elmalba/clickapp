Rails.application.routes.draw do

  namespace :ppt do
    resources :live
  end
  root   'home#index'
  get    '/home',    to: 'home#index'
  get    '/signup',  to: 'users#new'
  get    '/users',   to: 'users#index' #Muestra usuarios
  get    '/students',to: 'users#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout',  to: 'sessions#destroy'

  resources :courses
  resources :users
  resources :questions
  resources :request
#resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
