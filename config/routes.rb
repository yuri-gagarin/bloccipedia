Rails.application.routes.draw do

  devise_for :users

  root to: 'home#index'

  resources :wikis do
    member do
      get :delete
    end
  end

  resources :charges 



  get 'home/about'

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user_show'
  delete '/users/:id', to: 'users#destroy', as: 'user_delete'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
