Rails.application.routes.draw do

  devise_for :users, :skip => [:sessions]
  as :user do
    get 'signin' => 'devise/sessions#new', as: :new_user_session
    post 'signin' => 'devise/sessions#create', as: :user_session
    delete 'signout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  scope 'a', module: 'admin', as: 'admin' do
    scope "blog", except: [:show] do
      resources :posts
    end
    resources :comments, except: [:create, :new] do
      collection do
        delete 'destroy-batch' => "comments#destroy_batch", as: "destroy_batch"
      end
      member do
        put 'approve'
        put 'reject'
      end
    end
    resources :users, except: [:index, :new, :create, :destroy]
    get 'dashboard' => 'users#dashboard', as: 'root'
  end

  scope "blog" do
    get 'tags/:tag', to: 'posts#index', as: :tag
    resources :posts, only: [:index, :show] do
      # resources :comments, only: [:create, :new]
    end
  end

  root :to => "content#index"

end
