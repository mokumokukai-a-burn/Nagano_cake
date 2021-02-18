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
    resources :customers, only: [:show, :edit, :update] do
      member do
        get :unsubscrive
        patch :withdraw
      end
    end
  end

end
