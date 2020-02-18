Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # To list/read all tasks
  get 'tasks', to: 'tasks#index'

  # To create new task - 2 steps
  # 1. GET the task creation form
  get 'tasks/new', to: 'tasks#new'
  # 2. POST the parameters to create a new restaurant
  post 'tasks', to: 'tasks#create'

  # To read one task
  get 'tasks/:id', to: 'tasks#show', as: :task

  # To update tas - 2 steps
  # 1. GET the task (HTML) form (pre-filled with the task's attributes) for editing
  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  # 2. PATCH the parameters to update an existing task
  patch 'tasks/:id', to: 'tasks#update'

  delete 'tasks/:id', to: 'tasks#destroy'
