Rails.application.routes.draw do
  devise_for :users
    resources :todo_lists do
        resources :todo_items do
            member do
                patch :complete
            end
        end
    end
    
    get "/", to: "landing_pages#index"
    resources :landing_pages, only: [:index]
  
end
