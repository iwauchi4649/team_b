Rails.application.routes.draw do
  devise_for :credit_cards, controllers: {
    sessions: 'credit_cards/sessions',
    passwords: 'credit_cards/passwords',
    registration: 'credit_cards/registration'
  }
  devise_for :addresses, controllers: {
    sessions: 'addresses/sessions',
    passwords: 'addresses/passwords',
    registration: 'users/registration'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registration: 'users/registration'
  }

  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  resources :review do
    get "top"
    get "information"
    get "crcard"
    get "login"
    get "footer"
    get 'mypage'
    get 'phone'
    get 'done'
    get 'address'
    get 'main'
    get 'personal'
  end
  root "review#mypage"
end
