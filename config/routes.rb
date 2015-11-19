Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'users' }
  get 'heartbeat' => 'heartbeat#index'

  root 'welcome#index'
  resources :characters
  resources :world_views
end
