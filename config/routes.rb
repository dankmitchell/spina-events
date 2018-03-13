Spina::Engine.routes.draw do
  namespace :events, path: '' do
    resources :conferences, only: [:index, :show] do
      get '/venue', to: 'venues#show'
      resources :speakers, only: [:index, :show]
      resources :sponsors, only: [:index]
      resources :questions, only: [:index]
      resources :tickets, only: [:index]
    end

    # Admin routes
    namespace :admin, path: Spina.config.backend_path do
      scope '/events' do
        resources :conferences
        resources :organisations
        resources :venues
        resources :speakers
      end
    end
  end
end
