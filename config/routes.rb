Rails.application.routes.draw do

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/portfolio', to: 'static_pages#portfolio'
  get '/egg-cheater', to: 'static_pages#egg_cheater'

  resources :contact, only: [:index, :new, :create]
end
