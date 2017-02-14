Rails.application.routes.draw do
  root "hello_world#index"

  get "/hello_world" => "hello_world#index"
  get "/maps" => "maps#index"

  namespace :admin do
    resources :campaign, only: [:index]
  end

end
