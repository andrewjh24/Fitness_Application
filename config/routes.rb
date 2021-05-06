Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :workouts
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post "login", to: 'sessions#create'
  delete "logout", to: 'sessions#destroy'
  get 'search', to: 'workouts#search'
  resources :difficulties, except: [:destroy]
end
