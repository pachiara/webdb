Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :commands
  resources :services
  resources :types
  resources :domains
  resources :uses

  get 'roles/users'
  post   'roles/role/:id', to: 'roles#add_role', as: 'roles/add_role'
  delete 'roles/role/:id', to: 'roles#remove_role', as: 'roles/remove_role'

  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  resources :servers do
    resources :instances
  end
  get 'servers/:server_id/instances/:id/check/:command_id', to: 'instances#check', as: 'instances/check'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
