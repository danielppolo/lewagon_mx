Rails.application.routes.draw do

  resources :gardens do
    resources :plants, only: [:new, :create]
  end
  resources :plants, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


#  user can create garden
#  user can create a plant
# user can delete a plant