Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :commands
  resources :services
  resources :types
  resources :domains
  resources :uses
  get 'admin/users'
  post   'admin/role/:id', to: 'admin#add_role', as: 'admin/add_role'
  delete 'admin/role/:id', to: 'admin#remove_role', as: 'admin/remove_role'

  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  resources :servers do
    resources :instances
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
