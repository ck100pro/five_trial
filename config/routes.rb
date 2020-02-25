Rails.application.routes.draw do
  root"boards#index"
  resources:boards do 
    member do 
      post :list, :action => "list_create", :as => "list"
    end
  end
end
