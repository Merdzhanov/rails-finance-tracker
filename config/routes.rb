Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  devise_scope :user do 
    get "/users/sign_out" => "devise/sessions#destroy"
  end 
  root 'welcome#index'
  get '/users/sign_out', to: 'devise/sessions#destroy'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'
  resources :user_stocks, only: [:create, :destroy]
  get 'my_friends', to: 'users#my_friends'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
