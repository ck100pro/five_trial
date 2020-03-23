Rails.application.routes.draw do
  root "boards#index"
  resources :boards, except: [:new] do 
    resources :lists, only: [:create, :destroy, :update]
  end


  resources :lists, only: [] do
    resources :cards, shallow: true
  end
end
