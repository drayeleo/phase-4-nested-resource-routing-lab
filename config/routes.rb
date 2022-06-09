Rails.application.routes.draw do
  resources :items, only: [:index]

  resources :users, only: %i[show index] do
    resources :items, only: %i[index show create]
  end
end
