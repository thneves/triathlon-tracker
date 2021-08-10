Rails.application.routes.draw do
  devise_for :users

  unauthenticated do
    root 'pages#home'
  end

  authenticated :user do
    root "pages#triathlon_tracker", as: :authenticated_root
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
