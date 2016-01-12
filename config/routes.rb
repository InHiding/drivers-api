Rails.application.routes.draw do
  resources :drivers, only: [:index, :show, :create], format: :json
end
