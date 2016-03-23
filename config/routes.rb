Rails.application.routes.draw do
  devise_for :users
    resources :todo_lists do
        resources :todo_items do
            member do
                patch :complete
            end
        end
    end
    
    #patch "/todo_lists/:todo_list_id/todo_items/:id", to: "todo_item#update", as: :whatever
    get "/", to: "landing_pages#index"
    resources :landing_pages, only: [:index]
    resources :results, only: [:index]
  
end
