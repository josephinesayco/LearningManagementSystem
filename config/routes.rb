Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # You can have the root of your site routed with "root"

  devise_for :users, :controllers => {:registrations => "users/registrations"}
  devise_for :teachers, :skip => [:registrations] #, :controllers => {:sessions => "teachers/sessions"}

  devise_scope :teachers do
    authenticated :teacher do
      root 'students#index', as: :authenticated_teacher_root
    end
  end


  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
  end

  root "devise/sessions#new"

  resources :learning_systems, only: [:index, :create]
  resources :java_questions, only: [:index, :create]

  resources :teachers do
    collection do
      get :students
      get :prediction_result
      get :assessment_result
    end
  end
  resources :students

  resources :home, only: [:index]
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
