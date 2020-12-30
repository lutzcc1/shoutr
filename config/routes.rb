Rails.application.routes.draw do
  devise_for :users

  authenticated do
    root 'dashboards#show', as: 'authenticated_root'
  end

  unauthenticated do
    root 'homes#show', as: 'unauthenticated_root'
  end

  post "text_shouts" => "shouts#create", defaults: { content_type: TextShout }
  post "photo_shouts" => "shouts#create", defaults: { content_type: PhotoShout }

  resources :shouts, only: [:show] do
    member do
      post "like" => "likes#create"
      delete "unlike" => "likes#destroy"
    end
  end

  resources :users, only: [:show] do
    resources :followers, only: [:index]
    member do
      post "follow" => "followed_users#create"
      delete "unfollow" => "followed_users#destroy"
    end
  end

  resources :hashtags, only: [:show]
  resource :search, only: [:show]
end
