FoodRails::Application.routes.draw do
  
  root :to => 'welcome#index'
  resources :items
  resources :welcome
  match "/loaderio-84c5f942ce54fbd6a00301b619e83868" => 'welcome#index'
  match "/IEATISHOOTIPOST/:id" => "items#getIEATISHOOTIPOST"
  match "/SGFOODONFOOT/:id" => "items#getSGFOODONFOOT"
  match "/DANIEL%20FOOD%20DIARY/:id" => "items#getDANIELFOODDIARY"
  match "/LOVE%20SG%20FOOD/:id" => "items#getLOVESGFOOD"
  match "/LADY%20IRON%20CHEF/:id" => "items#getLADYIRONCHEF"        
  match "/IEATISHOOTIPOST" => "items#allIEATISHOOTIPOST"
  match "/SGFOODONFOOT" => "items#allSGFOODONFOOT"
  match "/DANIEL%20FOOD%20DIARY" => "items#allDANIELFOODDIARY"
  match "/LOVE%20SG%20FOOD" => "items#allLOVESGFOOD"
  match "/LADY%20IRON%20CHEF" => "items#allLADYIRONCHEF"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
