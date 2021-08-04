Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show,:index,:edit,:update,:create,:new] do
    resource :relationships, only: [:create,:destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  
  resources :books, only:[:create,:index,:show,:edit,:update,:destroy] do
    resources :book_comments, only: [:create,:destroy]
    resource :favorites, only: [:create,:destroy]
  end
  
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]

  get 'search' => "searches#search"
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
end
