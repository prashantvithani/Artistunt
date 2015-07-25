Rails.application.routes.draw do
  root 'search#home'

  post 'search/', to: 'search#search_artist', as: :search_artist
  get 'search/list_artists/:artist_query', to: 'search#list_artists', as: :list_artists, constraints: { artist_query: /[^\/]+/ }
  get 'search/list_artists/:artist_query/get_next_page', to: 'search#get_next_page', as: :get_next_page, constraints: { artist_query: /[^\/]+/ }
  get 'search/list_artists/:artist_query/get_previous_page', to: 'search#get_previous_page', as: :get_previous_page, constraints: { artist_query: /[^\/]+/ }

  get 'artist/:artist_name', to: 'search#show_artist', as: :show_artist, constraints: { artist_name: /.*/ }
  get 'similar_artist/:artist_name', to: 'search#get_similar', as: :get_similar, constraints: { artist_name: /.*/ }

  devise_for :users
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
