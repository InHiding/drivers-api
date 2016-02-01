Rails.application.routes.draw do
  resources :drivers, only: [:index, :show, :create], format: :json do
    resources :driver_positions, path: 'status', only: ['index', 'create'], as: :status
    get 'in-area', on: :collection, to: 'driver_positions#search'
  end
end
