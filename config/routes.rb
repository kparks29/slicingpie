Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'users#index'
  get '/' => 'users#index'
  get 'login' => 'users#new', as: :new_user
  post 'users' => 'users#create'
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  get 'users/:id' => 'users#show', as: :user
  patch 'users/:id' => 'users#update'

  get 'companies' => 'companies#index'
  get 'company/new' => 'companies#new', as: :new_company
  post 'companies' => 'companies#create'
  get 'company/:id' => 'companies#show', as: :company


  get 'grunts' => 'grunts#index'
  post 'grunts' => 'grunts#create'
  get 'grunt/:id' => 'grunts#show', as: :grunt
  get 'grunt/:id/edit' => 'grunts#edit', as: :edit_grunt
  patch 'grunt/:id' => 'grunts#update'

  resources :auths, only:[:create]
  get 'logout' => 'auths#destroy', as: :logout


  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
