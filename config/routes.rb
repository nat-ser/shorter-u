Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "urls#index"

  resources :urls, only: [:index, :create]
  get "/:friendly_id", to: "urls#show", as: :friendly

  match "*a", to: "application#render_404", via: :all
end
