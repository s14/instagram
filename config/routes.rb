Rails.application.routes.draw do
  get("/my_timeline", { :controller => "users", :action => "timeline" })
  get("/my_favorites", { :controller => "users", :action => "favorites" })

  devise_for :users
  root "photos#index"

  # Routes for the Following resource:
  # CREATE
  get '/followings/new' => 'followings#new'

  get('/create_following', { :controller => 'followings', :action => 'create' })

  # READ
  get('/followings', { :controller => 'followings', :action => 'index' })
  get('/followings/:id', { :controller => 'followings', :action => 'show' })

  # UPDATE
  get('/followings/:id/edit', { :controller => 'followings', :action => 'edit' })
  get('/update_following/:id', { :controller => 'followings', :action => 'update' })

  # DELETE
  get('/delete_following/:id', { :controller => 'followings', :action => 'destroy' })
  #------------------------------

  # Routes for the User resource:
  # CREATE
  get('/users/new', { :controller => 'users', :action => 'new' })
  get('/create_user', { :controller => 'users', :action => 'create' })

  # READ
  get('/users', { :controller => 'users', :action => 'index' })
  get('/users/:id', { :controller => 'users', :action => 'show' })

  # UPDATE
  get('/users/:id/edit', { :controller => 'users', :action => 'edit' })
  get('/update_user/:id', { :controller => 'users', :action => 'update' })

  # DELETE
  get('/delete_user/:id', { :controller => 'users', :action => 'destroy' })
  #------------------------------

  # Routes for the Favoriting resource:
  # CREATE
  get('/favoritings/new', { :controller => 'favoritings', :action => 'new' })
  get('/create_favoriting', { :controller => 'favoritings', :action => 'create' })

  # READ
  get '/favoritings', controller: 'favoritings', action: 'index'
  get('/favoritings/:id', { :controller => 'favoritings', :action => 'show' })

  # UPDATE
  get('/favoritings/:id/edit', { :controller => 'favoritings', :action => 'edit' })
  get('/update_favoriting/:id', { :controller => 'favoritings', :action => 'update' })

  # DELETE
  get('/delete_favoriting/:id', { :controller => 'favoritings', :action => 'destroy' })
  #------------------------------

  # Routes for the Comment resource:
  # CREATE
  get('/comments/new', { :controller => 'comments', :action => 'new' })
  get('/create_comment', { :controller => 'comments', :action => 'create' })

  # READ
  get('/comments', { :controller => 'comments', :action => 'index' })
  get('/comments/:id', { :controller => 'comments', :action => 'show' })

  # UPDATE
  get('/comments/:id/edit', { :controller => 'comments', :action => 'edit' })
  get('/update_comment/:id', { :controller => 'comments', :action => 'update' })

  # DELETE
  get('/delete_comment/:id', { :controller => 'comments', :action => 'destroy' })
  #------------------------------

  # Routes for the Photo resource:
  # CREATE
  get('/photos/new', { :controller => 'photos', :action => 'new' })
  post('/photos', { :controller => 'photos', :action => 'create' })

  # READ
  get('/photos', { :controller => 'photos', :action => 'index' })
  get('/photos/:id', { :controller => 'photos', :action => 'show' })

  # UPDATE
  get('/photos/:id/edit', { :controller => 'photos', :action => 'edit' })
  patch('/photos/:id', { :controller => 'photos', :action => 'update' })

  # DELETE
  delete('/photos/:id', { :controller => 'photos', :action => 'destroy' })
  #------------------------------

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
