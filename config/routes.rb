Rails.application.routes.draw do
 
  devise_for :customers
  devise_for :admins
  
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/show'
    get 'items/edit'
    get 'items/new'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/confirmation'
    get 'orders/completion'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdrawal'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
