Berlinarttours::Application.routes.draw do


  resources :trip_requests
  get "trip_requests_status_update", :to => "trip_requests#status_update"

  resources :trip_stations

  resources :trips

  get "trips_show_external", :to => "trips#show_external"

  get "trips_search_poi", :to => "trips#search_poi"
  post "trips_search_poi", :to => "trips#search_poi"


  get "guide_tours_show", :to => "guide_tours#show"
  get "guide_tours_new", :to => "guide_tours#new"
  post "guide_tours", :to => "guide_tours#create"
  get "guide_tours/new"
  get "guide_tours/edit"
  post "guide_tours/add_station"

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

  # Search POI
  get "search_pois/contact", to: "search_pois#contact"
  post "search_pois/contact", to: "search_pois#contact"

  get "search_pois/search", :to => "search_pois#search"
  post "search_pois/find", :to => "search_pois#find"
  post "search_pois", :to => "search_pois#index"

  resources :search_pois

  # Search Trips
  resources :search_trips do
  end
  get "search_trips/search", :to => "search_trips#search"
  post "search_trips/find", :to => "search_trips#find"
  post "search_trips", :to => "search_trips#index"

  devise_for :users
  resources :users

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  #Tourist Profiles
  get "profiles/search_guides", to: "profiles#search_guides"
  post "profiles/search_guides", to: "profiles#search_guides"
  get "profiles/contact", to: "profiles#contact"
  post "profiles/contact", to: "profiles#contact"

  get "profiles/new"
  get "profiles/create"
  get "profiles/show"
  get "profiles/edit", to: "users#edit"

  resources :profiles

  #Guide Profiles

  get "profile_guides/new"
  get "profile_guides/create"
  get "profile_guides/show"
  get "profile_guides/edit", to: "users#edit"

  resources :profile_guides

  #POI Profiles

  get "profile_pois/search_guides", to: "profile_pois#search_guides"
  post "profile_pois/search_guides", to: "profile_pois#search_guides"
  get "profile_pois/contact", to: "profile_pois#contact"
  post "profile_pois/contact", to: "profile_pois#contact"

  get "profile_pois/new"
  get "profile_pois/create"
  get "profile_pois/show"
  get "profile_pois/edit", to: "users#edit"

  resources :profile_pois

  # Contacts
  resources :contacts

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
