Rails.application.routes.draw do
  root"boards#index"
  resources:boards do 
    resources :lists, only: [:create, :destroy, :update]
  end
end
