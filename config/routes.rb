Rails.application.routes.draw do

  get '/shops/:id/requests', to:'shops#show_requests', as: 'shop_requests'

  devise_for :users
  resources :shops do
    resources :products do
      resources :requests
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'shops#index'

end
