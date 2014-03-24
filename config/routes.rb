Petbook::Application.routes.draw do

  devise_for :users
  resources :users, :only => [:index], :shallow => true do
    resources :pets
  end

  get "/users/:user/" => "users#profile", :as => "user_profile"

  root :to => "pages#home"
end
