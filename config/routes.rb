Rails.application.routes.draw do

  resources :wikis do
    member do
      get :delete
    end
  end

  devise_for :users

  root to: 'home#index'

  get 'home/about'

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user_show'
  delete '/users/:id', to: 'users#destroy', as: 'user_delete'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
