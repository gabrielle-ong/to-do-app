Rails.application.routes.draw do
    resources :todo_lists do
        resources :todo_items do
            member do
                patch :complete
            end
        end
    end
    
    root "todo_lists#index" 
    #makes localhost:3000 page the index page of todo_lists
  
end
