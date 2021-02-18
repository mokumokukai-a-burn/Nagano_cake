Rails.application.routes.draw do


  namespace :admin do
    root :to => "homes#top"
    devise_for :admins, controllers: {
      sessions: 'admin/admins/sessions',
      registrations: 'admin/admins/registrations',
      passwords: 'admin/admins/passwords'
    }
    resources :customers, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    #devise_for :customers
    get "/" => "homes#top"
    get "/about" => "homes#about"
    devise_for :customers, controllers: {
      sessions: 'public/customers/sessions',
      registrations: 'public/customers/registrations',
      passwords: 'public/customers/passwords'
    }
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items
    get '/orders/complete' => 'orders#complete'
    get '/orders/confirm' => 'orders#confirm'
    resources :orders, only:[:new,:create,:index,:show]
    resources :products, only:[:index, :show]
    resources :customers, only: [:show, :edit, :update, :unsubscrive, :withdraw]
  end


end
