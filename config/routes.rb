Rails.application.routes.draw do
  get 'report_attachments/destroy'

  resources :reports, only: [:index, :show]
  get '/reports/:id/form_deliver', to: 'reports#form_deliver', as: 'report_form_deliver'
  put '/reports/:id/deliver', to: 'reports#deliver', as: 'report_deliver'
  put '/reports/:id/approve', to: 'reports#approve', as: 'report_approve'
  put '/reports/:id/reformulate', to: 'reports#reformulate', as: 'report_reformulate'

  resources :scholarship_types

  resources :areas

  get 'projects/per_year'
  get 'projects/per_research_group'
  resources :projects

  resources :research_lines

  resources :research_groups

  resources 'documents', only: :destroy
  resources 'project_attachments', only: :destroy
  resources 'project_publications', only: :destroy
  resources 'report_attachments', only: :destroy

  resources :situations

  resources :students

  resources :researchers

  get 'home/index'

  devise_for :users
  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
