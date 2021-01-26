Rails.application.routes.draw do
  resources :communities do
    resources :posts
  end
  devise_for :users, controllers: {
    confirmations: 'confirmations',
    omniauth_callbacks: 'users/omniauth',
  }

  resources :apples

  # resources :users, only: [:index, :show, :edit, :update] do
  #  member do 
  #    delete 'delete_image/:image_id', action: 'delete_image', as: 'delete_image'
  #  end
  # end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/users', to: redirect('home#index')

  get '/search', to: "communities#search"

  get '/admin', to: "profiles#admin"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :subscriptions
  resources :votes
  resources :comments
  resources :profiles

  resources :dashboard, only: [:index]
  resources :home, only: [:index]
  root to: "home#index"
end
