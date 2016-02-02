Rails.application.routes.draw do
  resources :drivers, only: [:index, :show, :create], defaults: { format: :json } do
    resources :driver_positions, path: 'status', only: ['index', 'create', 'update'], as: :status
    get 'in-area', on: :collection, to: 'driver_positions#search'
  end
end
