Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :article_updates
  resources :articles
  resources :editor_revisions
  resources :employees
  resources :roles, except: [:show]
  resources :tags, only: [:index, :destroy]

  root to: "articles#index"
  
  get "/login", to: "sessions#new", as: "login"
  get "/auth/github/callback" => "sessions#create"
  post "/logout", to: "sessions#destroy", as: "logout"
end
