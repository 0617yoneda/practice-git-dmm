Rails.application.routes.draw do
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end

  devise_for :customers


  namespace :admins do
    root "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :products, only: [:index, :new, :show, :create, :edit, :update]
    resources :categories, only: [:create, :index, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_products, only: [:update]
  end


end
