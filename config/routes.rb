Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "callbacks"}, skip: [:sessions]
  devise_scope :user do
    # manually including the session delete path
    delete "/users/sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/', to: "nft#index", as: "nft_root",  constraints: {subdomain: 'nft'}
  root "homepage#index"
  get 'sprayzecoin/chart', to: "charts#sprayzecoin"

  get '/admin', to: "admin#index"
  namespace "admin" do
    resources :users, except: [:show, :new, :create]
    resources :crypto_coins, except: [:show, :new, :create, :index]
  end
end
