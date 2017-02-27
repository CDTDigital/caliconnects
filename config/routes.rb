Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions:'users/sessions' }

  devise_scope :user do
    get "/user/confirmation" => "users/registrations#confirmation"
    get "/user/success" => "users/registrations#success"
  end

  root "welcome#index"

  get "/preparedness" => "welcome#preparedness"

  get "disaster_events/earthquakes" => "disaster_events#earthquakes"
  get "disaster_events/fires" => "disaster_events#fires"
  get "disaster_events/rivers" => "disaster_events#rivers"
  get "disaster_events/tsunami" => "disaster_events#tsunami"
  get "disaster_events/weather" => "disaster_events#weather"

  get "/maps" => "maps#index"

  namespace :admin do
    resources :campaigns, only: [:index, :create, :show, :destroy] do
      resources :alerts, only: [:new, :create]
    end
  end

  resources :apidocs, only: [:index]
end
