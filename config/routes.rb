Rails.application.routes.draw do
  get '/user/:id', to: 'users#profile', as: :user
  devise_for :users
  resources :users
  root "events#index"
  resources :events do
    member do
      get "event_attendances"
      get "cancel_event_attendances"
      end
    end
end
