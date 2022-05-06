Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"
  get "home/about"=>"homes#about", as: "about"
  get "search" => "searches#search"

  resources :users, only: [:index,:show,:edit,:update] do
    member do
      get 'followers'
      get 'followings'
    end
    resource :relationships, only: [:create, :destroy]
  end

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
