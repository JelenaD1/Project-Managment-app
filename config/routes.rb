Rails.application.routes.draw do
 
  resources :reviews
  resources :mentors
  resources :stories do
    resources :mentors
  end
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories
  root to: 'projects#index'
  devise_for :users
  resources :projects do
    resources :tasks
  end
  
end
