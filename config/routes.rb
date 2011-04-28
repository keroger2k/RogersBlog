Blog::Application.routes.draw do
  devise_for :users
  resources :posts

  scope '/' do
    match '/youtube' => "info#youtube", :as => :youtube
  end

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
