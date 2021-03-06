BolaoApp::Application.routes.draw do

  resources :match_results
  resources :games
  resources :teams
  resources :hints
  resources :users

  root :to => 'main#index'

  match 'admin/index' => 'admin#index', :as => :admin

  match 'index' => 'main#index', :as => :index
  match 'cadastro' => 'main#cadastro', :as => :cadastro
  match 'ranking' => 'main#ranking', :as => :ranking
  match 'regras' => 'main#regras', :as => :regras

  match 'login/index' => 'login#index', :as => :login
  match 'login/do_login' => 'login#do_login', :as => :login_do_login
  match 'login/do_logout' => 'login#do_logout', :as => :logout

  match 'hints/result/savehint' => 'hints#saveHint', :as => :save_hint
  match 'hints/result/allhints' => 'hints#all_hints', :as => :all_hints  
  match 'hints/result/adminallhints' => 'hints#admin_all_hints', :as => :admin_all_hints
  match 'hints/result/calculator' => 'hints#calculator', :as => :calculator
  match 'hints/result/get_statistics' => 'hints#get_statistics', :as => :get_statistics

  match 'users/:id/reset_score' => 'users#reset_score', :as => :user_reset_score
  match 'users/calculate/reset_all_scores' => 'users#reset_all_scores', :as => :reset_all_scores
  match 'users/calculate/reset_all_hintspoints' => 'users#reset_all_hintspoints', :as => :reset_all_hintspoints

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
