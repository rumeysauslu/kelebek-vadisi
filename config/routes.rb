Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  authenticate :user do
    # admin
    scope 'admin', module: 'admin', as: 'admin' do
      get '/', to: 'home#index', as: 'root'
      resources :parents do
        get '/cocuklar', to: 'children#show', as: 'show_children'
      end
      resources :children do
        get '/paket-tanimla', to: 'subscriptions#new', as: 'new_subscription'
        post '/paket-tanimla', to: 'subscriptions#create', as: 'create_subscription'
        post '/oturum-baslat', to: 'sessions#start_session', as: 'new_session'
      end
      resources :packages
      resources :options
      resources :subscriptions
      resources :movements, only: [:index]
      resources :sessions, only: [:index]
      resources :surveys
      resources :announcements do
        post '/active', to: 'announcements#set_active', as: 'active'
      end
    end
    resources :survey_results, only:[:new,:create]
    get '/duyurular', to: 'announcements#index', as: 'announcements'
  end
end
