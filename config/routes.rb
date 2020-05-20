Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticate :user do
    # admin
    scope 'admin', module: 'admin', as: 'admin' do
      get '/', to: 'home#index', as: 'root'
      resources :parents
    end
  end
end
