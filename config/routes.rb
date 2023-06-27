Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    resources :orders, only: [:show,]
    resources :items, only: [:new, :show, :index, :edit, :create, :update]
    resources :customers, only: [:show, :index, :edit, :update]

    get 'homes/top' => "homes#top"
  end

  scope module: :public do
    root to: 'homes#top'
    post 'orders/confirmation' => "orders#confirmation"
    get 'orders/completion' => "orders#completion"
    resources :orders, only: [:show, :index, :new, :create]
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, only: [:index, :update, :create, :destroy]

    get '/customers/show' => "customers#show"
    get '/customers/information/edit' => "customers#edit"
    patch '/customers/information' => "customers#update"
    get 'customers/unsubscribe' => "customers#unsubscribe"
    patch 'customers/withdrawal' => "customers#withdrawal"
    get '/about' => "homes#about"

    resources :items, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
