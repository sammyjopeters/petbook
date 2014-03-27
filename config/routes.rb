Petbook::Application.routes.draw do

  # I can't remember why this is here but I don't think I should remove it...??
  resources :snapshots do
    member do
      post :addlike
      post :unlike
    end
  end

  resources :posts do
    member do
      post :addlike
    end
  end

  devise_for :users
  resources :users, :only => [:index], :shallow => true do
    member do
      post :follow
    end
    resources :pets, shallow: true
    resources :photos, :controller => "snapshots"
    resources :posts, shallow: true
  end

  resources :pets, :only => [:index, :create]
  resources :comments, :only => [:create]


  get "/users/:user/" => "users#profile", :as => "user_profile"
  get "/:user/newsfeed/" => "pages#newsfeed", :as => "newsfeed"

  root :to => "pages#home"
end
