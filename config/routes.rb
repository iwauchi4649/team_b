Rails.application.routes.draw do
  resources :review do
    get "hikaru"
    get "top"
    get "information"
    get "crcard"
    get "login"
    get "footer"
    get "address"
    get "done"
    get "phone"
  end
  root "review#hikaru"
end
