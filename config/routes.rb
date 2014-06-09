Onetree::Application.routes.draw do

   root :to => 'home#index'
   match 'projects/project_show_via_ajax_call' => 'projects#project_show_via_ajax_call'
   
   resources :projects

end