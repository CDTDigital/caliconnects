Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions:'users/sessions' }

  devise_scope :user do
    get "/user/confirmation" => "users/registrations#confirmation"
    get "/user/success" => "users/registrations#success"
  end

  root "welcome#index"

  get "/preparedness" => "welcome#preparedness"
  get "/terms" => "welcome#terms"

  get "disaster_events/earthquakes" => "disaster_events#earthquakes"
  get "disaster_events/fires" => "disaster_events#fires"
  get "disaster_events/rivers" => "disaster_events#rivers"
  get "disaster_events/tsunami" => "disaster_events#tsunami"
  get "disaster_events/weather" => "disaster_events#weather"

  namespace :admin do
    get "/fires" => "event_maps#fires"
    get "/earthquakes" => "event_maps#earthquakes"
    get "/rivers" => "event_maps#rivers"
    get "/weather" => "event_maps#weather"
    get "/tsunami" => "event_maps#tsunami"

    resources :campaigns, except: [:edit, :update] do
      get :archived, on: :collection

      resources :alerts, only: [:new, :create]
    end
  end

  resources :alerts, only: [:index]

  resources :apidocs, only: [:index]
end
