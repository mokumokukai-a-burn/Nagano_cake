Rails.application.routes.draw do

  namespace :public do
    resources :products, only:[:index, :show]
    resources :cart_items
  end
  
  
end
