Rails.application.routes.draw do
  resources :onduleurs do
    collection { post :import }
  end
  root to: "onduleurs#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
