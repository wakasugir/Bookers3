Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only => [:show, :index, :edit, :update]
  
  resources :books do
    resource :favorites, :only => [:create, :destroy]
    resources :book_comments, :only => [:create, :destroy]
  end
  
  get "home/about" => "home#about"
  get "home/index" => "home#index"
end
