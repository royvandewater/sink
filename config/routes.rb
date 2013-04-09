Sink::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#landing'

  resources :accounts

  namespace :api do
    namespace :v1 do
      resource :account do
        resources :tracks
      end
    end
  end

  get '/api/*path' => 'pages#not_found'
  get '/*path' => 'pages#show'
end
