Enki::Application.routes.draw do
  namespace :admin do
    resource :session

    resources :posts, :pages do
      post 'preview', :on => :collection
    end
    resources :comments
    resources :undo_items do
      post 'undo', :on => :member
    end

    get 'health(/:action)' => 'health', :action => 'index', :as => :health

    root :to => 'dashboard#show'
  end

	get 'about_me', to: 'pages#about_me'

  resources :archives, :only => [:index]
  resources :pages, :only => [:show]

  constraints :year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/ do
    get ':year/:month/:day/:slug/comments'  => 'comments#index'
    post ':year/:month/:day/:slug/comments' => 'comments#create'
    get ':year/:month/:day/:slug/comments/new' => 'comments#new'
    get ':year/:month/:day/:slug' => 'posts#show'
  end

  scope :to => 'posts#index' do
    get 'posts.:format', :as => :formatted_posts
    get '(:tag)', :as => :posts, :tag => /(?:[A-Za-z0-9_ \.-]|%20)+?/, :format => /html|atom/
  end

  root :to => 'posts#index'
end
