Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/dishes/:id", to: "dishes#show"

  patch "/dishes/:id", to: "dishes#update"

  get "/chefs/:id", to: "chefs#show"

  get "/chefs/:id/ingredients", to: "chefs#ingredients"

end
