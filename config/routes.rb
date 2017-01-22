Rails.application.routes.draw do

  get 'users/index'

  get 'users/delete'

  get 'users/destroy'

  resources :wikis do
    member do
      get :delete
    end
  end

  devise_for :users

  root to: 'home#index'

  get 'home/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
