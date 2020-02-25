Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
        root to: "posts#index"
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
        resources :users, only: [:show,:index]
        resources :posts do 
            resources :comments
            resources :likes
        end
        resources :friendships
        

end
