Petbook::Application.routes.draw do

  resources :posts

  devise_for :users
  resources :users, :only => [:index], :shallow => true do
    resources :pets
    resources :posts, :shallow => true do
    end
  end

  resources :pets, :only => [:index, :create]
  resources :comments, :only => [:create]


  get "/users/:user/" => "users#profile", :as => "user_profile"
  get "/:user/newsfeed/" => "pages#newsfeed", :as => "newsfeed"

  root :to => "pages#home"
end
