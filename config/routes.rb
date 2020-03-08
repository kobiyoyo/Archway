Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  resources :users
  devise_for :users,
             path: '',
             path_names: {sign_in: 'login', sign_out: 'logout', edit:'profile',
                          sign_up: 'signup'},
             controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  devise_scope :user do
    get "signup", to: "devise/registrations#new"
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
  end

  resources :posts do
    resources :comments
    resources :likes
  end
  get 'friends', to: 'friendships#index', as: 'friends'
  get 'friends/create/:id', to: 'friendships#create', as: 'add_friend'
  get 'friends/accept/:id', to: 'friendships#accept', as: 'accept_request'
  delete 'friends/deny/:id', to: 'friendships#deny', as: 'deny_request'
  delete 'friends/delete/:id', to: 'friendships#destroy', as: 'delete_friend'
  get 'users/profile/:id', to: 'users#users_profile', as: 'user_profile'
end