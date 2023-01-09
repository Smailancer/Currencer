Rails.application.routes.draw do
  get  'currencies/convert'
  root 'currencies#index'
  
  post 'convert' =>'currencies#convert'
  get 'update' =>'currencies#update_values'


  resources :currencies do
    # Add a custom route to the update action
    post 'update', on: :collection
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
