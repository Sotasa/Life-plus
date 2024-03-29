Rails.application.routes.draw do
  get 'blogs/index'
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  resources :blogs
 
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :habits do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :users, only: [:show] # ユーザーマイページへのルーティング

  root 'habits#index'
  
end
