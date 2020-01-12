Rails.application.routes.draw do
  resources :goods do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :review do
    get "top"
    get "information"
    get "crcard"
    get "login"
    get "footer"
    get "address"
    get "done"
    get "phone"
    get "mypage"
    get "main"
    get "personal"
    get "crcard_add"
    get "confirm_purchase"
    get "profile"
    get "logout"
    get "product_details"
  end
  root "review#mypage"
end
