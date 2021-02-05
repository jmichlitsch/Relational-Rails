Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/dealerships', to: 'dealerships#index'
  get '/dealerships/new', to: 'dealerships#new'
  post '/dealerships', to: 'dealerships#create'
  get '/dealerships/:id', to: 'dealerships#show'
  get '/dealerships/:id/edit', to: 'dealerships#edit'
  patch '/dealerships/:id', to: 'dealerships#update'
  delete '/dealerships/:id', to: 'dealerships#destroy'

  get '/shops', to: 'shops#index'
  get '/shops/new', to: 'shops#new'
  post '/shops', to: 'shops#create'
  get '/shops/:id', to: 'shops#show'
  get '/shops/:id/edit', to: 'shops#edit'
  patch '/shops/:id', to: 'shops#update'
  delete '/shops/:id', to: 'shops#destroy'
  get '/shops/:id/boards', to: 'shops#boards'
  get '/shops/:id/boards/new_board', to: 'shops#new_board'
  post '/shops/shop.id/boards', to: 'shops#create_board'

  get '/snowboards', to: 'snowboards#index'
  get '/snowboards', to: 'snowboards#new'
  post '/snowboards', to: 'snowboards#create'
  get '/snowboards/:id', to: 'snowboards#show'
  get '/snowboards/:id/edit', to: 'snowboards#edit'
  patch '/snowboards/:id', to: 'snowboards#update'
  delete '/snowboards/:id', to: 'snowboards#destroy'


  get '/vehicles', to: 'vehicles#index'
  get '/dealerships/:id/auto', to: 'dealerships#auto'

end
