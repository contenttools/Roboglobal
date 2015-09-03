Rails.application.routes.draw do

  resources :contacts, only: :create

  namespace :admin do
    resources :subscribers, only: :index
  end

  mount Ckeditor::Engine => '/ckeditor'

  scope '/admin' do
    resources :blog_posts, except: :show do
      member do
        get 'remove_image'
        get 'remove_file'
        get 'remove_video'
      end
    end
    resources :attachments
    resources :pdf_attachments
    resources :embedded_attachments
    resources :page_embeds, only: [:index, :update]
  end

  get '/admin' => 'admin#dashboard'

  devise_for :users

  get 'home' => 'pages#home'

  get 'about-us' => 'pages#about_us'

  get 'legal-information' => 'pages#legal_information'

  get 'us-index' => 'pages#us_index'
  get 'eu-index' => 'pages#eu_index'

  get 'robo-news' => 'blog_posts#robo_news'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'pages#home'
  authenticated :user do
    root to: "admin#dashboard", as: :authenticated_root
  end
  unauthenticated do
    root to: "pages#home", as: :unauthenticated_root
  end

  resources :subscribers, only: :create


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
  match '/:id', to: 'blog_posts#show', via: :get
end
