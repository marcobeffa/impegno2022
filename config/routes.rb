Rails.application.routes.draw do
  resources :sublocations
  resources :prenotations
  resources :contacts
  resources :events
  resources :categories

  
  
  get 'dashboard/index'
  get 'dashboard/note'
  get 'dashboard/passate'
  get 'dashboard/eventi'
  get 'dashboard/soldi'
  get 'dashboard/energie'
  get 'dashboard/accessi'
  get 'dashboard/attenzione'
  get 'dashboard/luoghi'
  get 'dashboard/abilita'
  get 'dashboard/attivita'
  resources :noteslots
  resources :slots
  get 'privata/pastslot'
  get 'privata/noslot'
  get 'privata/todoslot'
  
  resources :slots 
  resources :calendars do
    resources :categories
    member do
      get 'pastslot'
      get 'noslot'
      get 'todoslot'
      
      get "passate"
      get "future"
      get "settimana"
    end
  end 
  resources :notes
  resources :profiles do
    member do
      get "pubcalendar"
      get "pastcalendar"
      get "luoghi"
      get "passate"
      get "future"
      get "settimana"
    end 
  end

  devise_for :users
  get 'pages/home'
  get 'pages/about'
  get 'pages/calendar'
  get 'pages/pastcalendar'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "pages#home"

  root "pages#calendar"
  # authenticate :user do
   # root "dashboard#index", as: :authenticated_root
  # end

  

  
end
