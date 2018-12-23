Rails.application.routes.draw do
  get 'recipes/new' => "recipes#new"
  get 'topics/new' => "topics#new"

  get 'sessions/new'
  get 'signup' => "users#new"
  get '/' => "home#top"
  root 'home#top'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  resources :users
  resources :recipes
  resources :topics, only: [:index, :new, :create, :topic_id] do
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
