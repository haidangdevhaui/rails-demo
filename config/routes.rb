Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/todos', to: 'todos#index'

  get '/todos/create', to: 'todos#create', as: 'get_todo_create'
  post '/todos/create', to: 'todos#create', as: 'post_todo_create'

  get '/todos/update/:id', to: 'todos#update', as: 'get_todo_update'
  put '/todos/update/:id', to: 'todos#update', as: 'put_todo_update'

  get '/todos/delete/:id', to: 'todos#delete', as: 'todo_delete'
end
