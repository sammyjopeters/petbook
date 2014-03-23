Petbook::Application.routes.draw do
  resources :pets

  devise_for :users
  resources :users, :only => [:index, :show]

  root :to => "pages#home"
end
