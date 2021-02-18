Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :admin do
    root :to => "homes#top"
    devise_for :admins, controllers: {
      sessions: 'admin/admins/sessions',
      registrations: 'admin/admins/registrations',
      passwords: 'admin/admins/passwords'
    }
    resources :orders, only: [:index, :show]
    resources :genres, only: [:index, :new, :create, :edit, :update]
    resources :products, only: [:index, :new, :create, :edit, :update, :show ]
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
    get '/orders/complete' => 'orders#complete'
    get '/orders/confirm' => 'orders#confirm'
    resources :orders, only:[:new,:create,:index,:show]
    resources :products, only:[:index, :show]
    resources :customers, only: [:show, :edit, :update, :unsubscrive, :withdraw]

#     resources :customers, only: [:show, :edit, :update] do
#       member do
#         get :unsubscrive
#         patch :withdraw
#       end
#     end

  end
end
