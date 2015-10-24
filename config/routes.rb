Rails.application.routes.draw do

   root to: "welcome#intro"

   get "/index", to: "welcome#index"

   get "users/new",      to: "users#new",  as: "sign_up"

   post "users/:id",      to: "users#create"

   get "users/:id",      to: "users#show", as: "profile"

   get "users/:id/edit", to: "users#edit", as: "edit_profile"

   patch "users/:id/edit", to: "users#update"

   delete "users/:id",      to: "users#destroy"

   get "sessions/new", to: "users#new", as: "login"
   
end
