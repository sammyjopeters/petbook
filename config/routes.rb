Petbook::Application.routes.draw do

  devise_for :users
  resources :users, :only => [:index, :show], :shallow => true do
    resources :pets
  end

  root :to => "pages#home"
end
