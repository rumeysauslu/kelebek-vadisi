Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
      end
      resources :packages
      resources :options
      resources :subscriptions
      resources :movements, only: [:index]
    end
  end
end
