Rails.application.routes.draw do
  resources :review do
    get "hikaru"
    get "top"
    get "information"
    get "crcard"
    get "login"
    get "footer"
  end
  root "review#hikaru"
end
