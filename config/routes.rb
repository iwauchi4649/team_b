Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'phones', to: 'users/registrations#new_phone'
    post 'phones', to: 'users/registrations#create_phone'
    get 'credit_cards', to:'users/registrations#new_credit_card'
    post 'credit_cards', to:'users/registrations#create_credit_card'
  end

  resources :goods do
    collection do
      get "get_category_children", defaults: { format: "json" }
      get "get_category_grandchildren", defaults: { format: "json" }
    end
  end

  resources :review do
    get "top"
    get "crcard"
    get "login"
    get "footer"
    get "done"
    get "mypage"
    get "main"
    get "personal"
    get "crcard_add"
    get "confirm_purchase"
    get "profile"
    get "logout"
    get "product_details"
    get "crcard_add_input"
  end
  root "goods#index"
end
