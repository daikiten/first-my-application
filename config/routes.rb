Rails.application.routes.draw do
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root to: 'events#index'
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
 get 'signup', to: 'users#new'
resources :users

resources :events do
 collection do
   get :search
 end
end
resources :questions, only: [:new, :create]
resources :relationships, only: [:create, :destroy]
end