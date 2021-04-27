Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "store_details#index"

  resources :store_details do
  	resources :store_ratings
  end
end
