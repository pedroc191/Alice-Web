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

  get "citas/registrar", to: "citas#registrar"
  get "home/login"

  get "home/index"
  
  get "home/suscripcion"
  post "home/suscribirse"
  
  get "home/contacto"
  post "home/contactar"

  get "home/preguntas_frecuentes"

  get 'citas/consultar'

  get "noticias/ver/:slug", to: "noticias#ver", as: "noticias_ver"
  get "noticias/categoria/:slug", to: "noticias#categoria", as: "noticias_categoria"
  
  get "eventos/ver/:slug", to: "eventos#ver", as: "eventos_ver"
  get "eventos/categoria/:slug", to: "eventos#categoria", as: "eventos_categoria"
  
  get "categoria_servicios/mas_categorias/:slug", to: "categoria_servicios#mas_categorias", as: "categoria_servicios_mas_categorias"
  get "categoria_servicios/mas_servicios/:slug", to: "categoria_servicios#mas_servicios", as: "categoria_servicios_mas_servicios"
  
  get "servicios/ver/:slug", to: "servicios#ver", as: "servicios_ver"
  get "servicios/solicitar_cita/:slug", to: "servicios#solicitar_cita", as: "servicios_solicitar_cita"
  
  get "servicios/validar", to: "servicios#validar", as: "servicios_validar"
  get "/buscar_semana", to: "servicios#buscar_semana", as: "buscar_semana"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  root to: 'home#index'
  
  get "/buscar_semana", to: "servicios#buscar_semana"#, as: "servicios_buscar_semana"
  get "/especialistas", to: "servicios#especialistas"


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
