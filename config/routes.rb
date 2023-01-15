Rails.application.routes.draw do
  root 'currencies#index'
  
  get  'currencies/convert'
  post 'convert' =>'currencies#convert'
  get 'update' =>'currencies#update_values'
  
end


