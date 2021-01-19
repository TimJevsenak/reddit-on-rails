Rails.application.routes.draw do
  resources :communities
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/users', to: redirect('home#index')

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :subscriptions

  resources :dashboard, only: [:index]
  resources :home, only: [:index]
  root to: "home#index"
end
