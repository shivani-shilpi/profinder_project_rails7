Rails.application.routes.draw do
  resources :pationts 
  resources :appointments
  resources :physicians 
  resources :snippets
  get 'snippets/new'
  
  devise_for :agents
  resources :mailers
  resources :images do
    resources :notes
  end
  resources :plants do 
    resources :notes
    collection do
      get 'plant_pdf'
      get 'plant_csv'
    end
  end
  resources :users do
     collection do
      get :fetch_country_states
     end
  end
  root 'home#index'
  get 'tool/index' 
  get "home/render_user_data", to: "home#render_user_data"
   
  patch 'drag/plant'
  resources 'recipes' do
    resource :famouse_recipe_city
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
