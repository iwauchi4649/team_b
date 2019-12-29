Rails.application.routes.draw do
  resources :review do
    get "top"
    get "information"
    get "crcard"
    get "login"
    get "footer"
    get "address"
    get "done"
    get "phone"
    get 'mypage'
    get 'main'
    get 'personal'
    get "crcard_add"
    get 'profile'
    
  end
  root "review#mypage"
end