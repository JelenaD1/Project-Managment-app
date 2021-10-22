Rails.application.routes.draw do
 
  resources :stories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories
  root to: 'projects#index'
  devise_for :users
  resources :projects do
    resources :tasks
  end
  
end
