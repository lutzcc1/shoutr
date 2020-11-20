Rails.application.routes.draw do
  devise_for :users

  authenticated do
    root 'dashboards#show', as: 'authenticated_root'
  end

  unauthenticated do
    root 'homes#show', as: 'unauthenticated_root'
  end

  resources :shouts, only: [:create, :show] do
    member do
      post "like" => "likes#create"
      delete "unlike" => "likes#destroy"
    end
  end
  resources :users, only: [:show]
end
