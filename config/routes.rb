Berlinarttours::Application.routes.draw do


  resources :guide_tours do
    resources :stations
  end

  get "stations/create"
  get "stations/new"
  get "stations/edit"
  get "stations/show"

  get "guide_tours/search", :to => "guide_tours#search"
  get "guide_tours", :to => "guide_tours#show"
  post "guide_tours", :to => "guide_tours#create"
  get "guide_tours/new"
  get "guide_tours/edit"
  get "guide_tours/show"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'intro/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root :to => "intro#index", :locale => "de"


  get "tourist_home", :to => "tourist_home#index"
  get "guide_home", :to => "guide_home#index"
  get "poi_home", :to => "poi_home#index"

  get "tourist_tours", :to => "tourist_tours#index"

  get "search_pois/search", :to => "search_pois#search"
  post "search_pois/find", :to => "search_pois#find"
  post "search_pois", :to => "search_pois#index"

  resources :search_pois do
  end

  devise_for :users
  resources :users

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  resources :profiles do
    member do
      #get "load_profile_content"
    end
  end

  get "profiles/new"
  get "profiles/create"
  get "profiles/show"
  get "profiles/edit", to: 'users#edit'


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
