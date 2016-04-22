require "constraints/subdomain_required"

Rails.application.routes.draw do


  
  devise_for :users

  constraints(SubdomainRequired) do
     scope module: "accounts" do
     root to: "todos#index", as: :account_root
     resources :todos
     resources :invoices
     resources :invitations, only: [:new, :create] do
          member do
              get :accept
              patch :accepted
          end
      end
    end

  end

  get 'pages/home'

  get 'pages/profile'

  get 'pages/explore'

  root to: "home#index"
  get "/accounts/new", to: "accounts#new", as: :new_account
  post "/accounts", to: "accounts#create", as: :accounts
  get "signed_out", :to => "users#signed_out"


end
