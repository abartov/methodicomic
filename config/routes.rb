Methodicomic::Application.routes.draw do
  get "issues/list"
  get "issues/:id/view" => 'issues#view', as: 'issues_view'
  get "issues/:id/read" => 'issues#toggle_read', as: 'issues_read'
  get "issues/:id/read_next" => 'issues#read_next', as: 'issues_next_read'
  get "issues/:id/acquire" => 'issues#toggle_acquired', as: 'issues_acquire'
  get "issues/:id/track" => 'issues#toggle_track', as: 'issues_track'
  get "issues/unread"
  get "issues/unacquired"
  get "issues/search_by_writer"
  get "series/search"
  get "series/list"
  get "series/:id/view" => 'series#view', as: 'series_view'
  get "series/:id/follow" => 'series#follow', as: 'series_follow'
  get "series/:id/unfollow" => 'series#unfollow', as: 'series_unfollow'
  get "session/create"
  get "welcome/index"
  get "welcome/login"
  match '/auth/:provider/callback', to: 'session#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'session#destroy', as: 'signout', via: [:get, :post]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
