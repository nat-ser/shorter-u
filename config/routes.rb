Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "urls#index"

  resources :urls, param: :friendly_id, only: [:index, :create, :show]

  match "*a", to: "application#render_404", via: :all
end
