Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registration: 'users/registration'
  }
  devise_scope :user do
    get 'users/addresses' => 'users/registrations#addresses'
  end

  def devise_scope(scope)
    constraint = lambda do |request|
      request.env["devise.mapping"] = Devise.mappings[scope]
      true
    end

    constraints(constraint) do
      yield
    end
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
