Rails.application.routes.draw do

  namespace :admin do
    root :to => "homes#top"
    devise_for :admins, controllers: {
      sessions: 'admin/admins/sessions',
      registrations: 'admin/admins/registrations',
      passwords: 'admin/admins/passwords'
    }
    resources :products, only: [:index, :new, :create, :edit, :update, :show ]
    resources :orders, only: [:index, :show]
    resources :genres, only: [:index, :new, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    get "/" => "homes#top"
    get "/about" => "homes#about"
    devise_for :customers, controllers: {
      sessions: 'public/customers/sessions',
      registrations: 'public/customers/registrations',
      passwords: 'public/customers/passwords'
    }

    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items
    resources :products
    resources :orders, only:[:new,:create,:index,:show]
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :customers, only: [:show, :edit, :update] do
      member do
        get :unsubscrive
        patch :withdraw
      end
    end
  end
end