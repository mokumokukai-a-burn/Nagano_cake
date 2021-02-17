Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
    resources :genres
    resources :cart_items
    resources :products, only:[:index, :show]
    resources :customers, only: [:show, :edit, :update, :unsubscrive, :withdraw]
  end
  
  
  
end
