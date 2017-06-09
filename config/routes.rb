Rails.application.routes.draw do

  root "static_pages#home"
  get "/home", to: "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/signup", to: "users#new"
<<<<<<< 83d2646527dec5f49b67004e257ae960e55ae3c3
  post "/signup",  to: "users#create"

=======
>>>>>>> Fix regex mail,user
  resources :users
end
