Rails.application.routes.draw do
  resources :review do
    get 'hikaru'
  end
  root 'review#hikaru'
end
