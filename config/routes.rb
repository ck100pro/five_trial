Rails.application.routes.draw do
  root "boards#index"
  resources:boards do 
    resources :lists, only: [:create, :destroy, :update] do
      resources :cards, only: [:create, :destroy, :update]
    end
  end
end
