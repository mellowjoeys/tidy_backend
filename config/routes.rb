Rails.application.routes.draw do
  namespace :api do
    get '/chores' => 'chores#index'
    post '/chores' => 'chores#create'
    get '/chores/:id' => 'chores#show'
    patch '/chores/:id' => 'chores#update'
    delete '/chores/:id' => 'chores#destroy'

    get '/houses' => 'houses#index'
    post '/houses' => 'houses#create'
    get '/houses/:id' => 'houses#show'
    patch '/houses/:id' => 'houses#update'
    delete '/houses/:id' => 'houses#destroy'

    get '/suggestions' => 'suggestions#index'
    post '/suggestions' => 'suggestions#create'
    get '/suggestions/:id' => 'suggestions#show'
    patch '/suggestions/:id' => 'suggestions#update'
    delete '/suggestions/:id' => 'suggestions#destroy'

    get '/user_chores' => 'user_chores#index'
    post '/user_chores' => 'user_chores#create'
    get '/user_chores/:id' => 'user_chores#show'
    patch '/user_chores/:id' => 'user_chores#update'
    delete '/user_chores/:id' => 'user_chores#destroy'

    get '/users' => 'users#index'
    post '/users' => 'users#create'
    get '/users/:id' => 'users#show'
    patch '/users/:id' => 'users#update'
    delete '/users/:id' => 'users#destroy'

    post '/sessions' => 'sessions#create'
  end
end
