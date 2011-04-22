Blog::Application.routes.draw do
  devise_for :users
  resources :posts

  devise_scope :user do 
    get "/login", :to => "devise/sessions#new" 
    get "/logout", :to => "devise/sessions#destroy"
    get "/register", :to => "devise/registrations#new" 
  end

  namespace "admin" do 
    root :to => "posts#index"
    resources :posts
  end

  root :to => "posts#index"

end
