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

  resource :many_to_many_rels

  resource :dynamic_elements, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
