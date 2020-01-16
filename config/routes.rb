Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registration: 'users/registration'
  }
  resources :signup do
    collection do
    get "step1"
    get "step2"
    get "step3"
    get "step4"
    end
  end
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
