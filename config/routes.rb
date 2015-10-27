Rails.application.routes.draw do

   # Home Page Routes #
   root to: "welcome#intro"

   get "/index", to: "welcome#index"

   # User Routes #
   get "/users/new", to: "users#new",  as: "sign_up"

   post "/users", to: "users#create"

   get "/users/:id", to: "users#show", as: "profile"

   get "/users/:id/edit", to: "users#edit", as: "edit_profile"

   patch "/users/:id/edit", to: "users#update"

   delete "/users/:id", to: "users#destroy"

   # Sessions Routes #
   get "/sessions/new", to: "sessions#new", as: "login"

   post "/sessions", to: "sessions#create"

   delete "/sessions/destroy", to: "sessions#destroy", as: "logout"

   # Map Routes #
   get "/maps", to: "maps#index", as: "gallery"

   get "/maps/new", to: "maps#new", as: "map_creator"

   post "/maps", to: "maps#create"

end
