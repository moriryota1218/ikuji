Rails.application.routes.draw do

  get 'recipes/new' => "recipes#new"
  get 'new_recipes' => "recipes#newRecipes"
  get 'topics/new' => "topics#new"
  get 'new_topics' => "topics#newTopics"

  get 'sessions/new'
  get 'signup' => "users#new"
  get '/' => "home#top"
  root 'home#top'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  resources :users
  resources :recipes, only: [:index, :new, :show, :create, :destroy, :recipe_id] do
    resources :likes, only: [:create]
  end
  resources :topics, only: [:index, :new, :create, :topic_id, :destroy] do
    resources :comments, only: [:create]
  end
  delete '/recipes/:recipe_id/likes' => 'likes#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
