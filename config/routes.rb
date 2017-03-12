Rails.application.routes.draw do


  resources :eventos, only: [:index]
  resources :noticias, only: [:index]

  resources :citas, only: [:solicitar]

  resources :categoria_servicios, only: [:show, :index] do
    
    resources :especialidades, only: [:show, :index] do

      resources :servicios, only: [:show, :index] do
  
        resources :especialistas, only: [:show, :index]
      
      end
    end
  end

  get "home/index"
  post "home/create"
  get "home/suscribirse"

  #get "servicios/especialistas"

  get "citas/solicitar"
  get "home/contacto"
  get "home/preguntas_frecuentes"
  get "noticias/leer"
  get "eventos/ver"
  get "home/solicitar"
  get "home/solicitar2"
  get "home/solicitar3"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  root to: 'home#index'

  get '/especialistas', :to => 'servicios#especialistas'


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
