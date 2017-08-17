Rails.application.routes.draw do
  get 'division/index', to: 'divisions#index'
  get 'division', to: 'divisions#index'

  get 'division/add', to: 'divisions#add'
  post 'division/add', to: 'divisions#add'

  get 'division/:id', to: 'divisions#edit'
  patch 'division/:id', to: 'divisions#edit'
  
  get 'report/index', to: 'reports#index'
  get 'report', to: 'reports#index'
  post 'report', to: 'reports#index'
  post 'report/index', to: 'reports#index'
  
  # get 'report/find', to: 'reports#find'
  # post 'report/find', to: 'reports#find'
  
  get 'report/delete/:id', to: 'reports#delete'
  post 'report/delete/:id', to: 'reports#delete'
  post 'report/delete', to: 'reports#delete'
  
  get 'report/add', to: 'reports#add'
  post 'report/add', to: 'reports#add'
  
  get 'report/:page', to: 'reports#index'
  post 'report/:page', to: 'reports#index'

  get 'report/edit/:id', to: 'reports#edit'
  patch 'report/edit/:id', to: 'reports#edit'
  
  get 'report/detail/:id', to: 'reports#detail'
  
  get 'report/show/:id', to: 'reports#show'

  get 'user/index', to: 'users#index'
  get 'user', to: 'users#index'
  
  get 'user/add', to: 'users#add'
  post 'user/add', to: 'users#create'
  
  get 'user/find', to: 'users#find'
  post 'user/find', to: 'users#find'
  
  get 'user/edit/:id', to: 'users#edit'
  patch 'user/edit/:id', to: 'users#update'
  
  get 'user/delete/:id', to: 'users#delete'
  
  get 'user/:id', to: 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
