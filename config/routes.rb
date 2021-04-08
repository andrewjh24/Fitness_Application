Rails.application.routes.draw do
  resources :workouts
  root 'pages#home'
  get 'about', to: 'pages#about'
end
