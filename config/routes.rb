Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  get "/demo", :action => 'demo', :controller => "visitors"
  devise_for :users
  resources :users
  resources :brief_types
  resources :briefs
end
