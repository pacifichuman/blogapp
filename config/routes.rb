Rails.application.routes.draw do
  root 'pages#index'
  #get 'about', to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'myarticles', to: 'articles#myarticles'
  get 'mytags', to: 'articles#mytags'
end
