Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'todos/:id/complete', to:'todos#complete', as: 'todos_complete'
  get 'todos/list', to: 'todos#list', as:'list_todos'
  root 'todos#index'
  resources :todos


end
