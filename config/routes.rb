Rails.application.routes.draw do
  get 'admin/users'
  post   'admin/role/:id', to: 'admin#add_role', as: 'admin/add_role'
  delete 'admin/role/:id', to: 'admin#remove_role', as: 'admin/remove_role'

  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  resources :instances
  resources :servers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
