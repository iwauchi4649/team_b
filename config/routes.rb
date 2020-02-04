Rails.application.routes.draw do
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                     }
  devise_scope :user do
    get "new_top", to: "users/registrations#new_top"
    get "addresses", to: "users/registrations#new_address"
    post "addresses", to: "users/registrations#create_address"
    get "phones", to: "users/registrations#new_phone"
    post "phones", to: "users/registrations#create_phone"
    get "credit_cards", to: "users/registrations#new_credit_card"
    post "credit_cards", to: "users/registrations#create_credit_card"
    get "done", to: "users/registrations#done"
    get "mypage", to: "users/registrations#mypage"
    get "crcard_add", to: "users/registrations#crcard_add"
    get "crcard_add_input", to: "users/registrations#crcard_add_input"
    get "personal", to: "users/registrations#personal"
    get "logout", to: "users/registrations#logout"
    get "profile", to: "users/registrations#profile"
  end

  resources :goods do
    collection do
      get "get_category_children", defaults: { format: "json" }
      get "get_category_grandchildren", defaults: { format: "json" }
    end
  end

  resources :review do
    get "mypage"
    get "personal"
    get "crcard_add"
    get "confirm_purchase"
    get "profile"
    get "logout"
    get "product_details"
    get "crcard_add_input"
  end

  post "likes/:good_id/create", to: "likes#create", constraints: { good_id: /\d+/ }, as: :likes_create
  post "likes/:good_id/delete", to: "likes#delete", constraints: { good_id: /\d+/ }, as: :likes_delete
  root "goods#index"
end
