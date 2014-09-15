Onetree::Application.routes.draw do

   devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'create_new_onetree' }

   root :to => 'home#index'
   match 'projects/project_show_via_ajax_call' => 'projects#project_show_via_ajax_call'
   
   resources :projects
   resources :services
   resources :content_management

end