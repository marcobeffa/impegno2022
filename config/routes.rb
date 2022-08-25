Rails.application.routes.draw do
  resources :notes
  resources :profiles do
    member do
      get "passate"
      get "future"
      get "settimana"
    end 
  end
  devise_for :users
  get 'pages/home'
  get 'pages/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
