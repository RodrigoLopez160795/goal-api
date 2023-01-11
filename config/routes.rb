Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/goals', to: 'goals#index_by_list'
  post '/goal/create', to: 'goals#create'
  get '/goal/:id', to: 'goals#show'
  patch '/goal/:id', to: 'goals#update'
  get '/users', to: 'users#show'
  get '/list_name', to: 'lists#list_name'
end
