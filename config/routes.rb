Rails.application.routes.draw do
    resources :todo_lists do
        resources :todo_items
    end
    
    root "todo_lists#index" 
    #makes localhost:3000 page the index page of todo_lists
  
end
