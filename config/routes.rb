Rails.application.routes.draw do
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   passwords: 'users/passwords',
  #   registration: 'users/registration'
  # }
  resources :signup do
    collection do
    get "information"
    get "phone"
    get "address"
    get "crcard"
    post "done"
    end
  end
  resources :goods do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
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
  end
  root "review#main"
end
