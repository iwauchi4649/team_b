Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registration: 'users/registration'
  }
  devise_scope :user do
    get 'second_page' => 'users/registrations#second_page'
  end
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
