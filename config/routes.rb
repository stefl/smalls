Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  get "/demo", :action => 'demo', :controller => "visitors"
  devise_for :users
  resources :users
  resources :brief_types
  resources :briefs do
    collection do
      get :fake
    end

    member do
      get :admin
      patch :transition
    end

    resources :pitches do
      collection do
        get :fake
      end

      member do
        get :admin
      end
    end
  end
  resources :pitches
end
