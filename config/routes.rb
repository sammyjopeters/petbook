Petbook::Application.routes.draw do
  resources :pets

  devise_for :users

  root :to => "pages#home"
end
