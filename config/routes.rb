Rails.application.routes.draw do
  resources :items
  resources :item_labels
  resources :labels
  resources :pages
  resource :page_previews, only: %i[show create]
  resources :articles
  resources :tabs, only: [:index]
  resource :infinite_scrolls, only: [:show]

  resources :products, only: %i[index new create edit update destroy]
  resource :product_model_part, only: %i[create destroy]
end
