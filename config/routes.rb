Rails.application.routes.draw do
  resources :review do
    get "top"
    get "information"
    get "crcard"
    get "login"
    get "footer"
    get 'hikaru'
    get 'hikaru2'
    get 'personal'
  end
  root "review#hikaru"
end
