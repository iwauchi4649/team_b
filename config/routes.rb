Rails.application.routes.draw do
  resources :review do
    get 'hikaru'
    get 'footer'
  end
  root 'review#hikaru'
end
