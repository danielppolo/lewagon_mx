Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants
  # # INDEX in the browser
  # get 'restaurants', to: 'restaurants#index', as: :restaurants
  # # CREATE in the server
  # post 'restaurants', to: 'restaurants#create'
  # # NEW FORM in the browser
  # get "restaurants/new", to: "restaurants#new"
  # # EDIT FORM in the browser
  # get "restaurants/:id/edit", to: "restaurants#edit"
  # # UPDATE in the server
  # patch "restaurants/:id", to: "restaurants#update"
  # # SHOW in the browser
  # get "restaurants/:id", to: "restaurants#show", as: :restaurant
  # # DELETE in the server
  # delete "restaurants/:id", to: "restaurants#destroy"
end
