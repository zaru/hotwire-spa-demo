Rails.application.routes.draw do
  resources :items
  resources :item_labels
  resources :labels
  resources :pages
  resource :page_previews, only: [:show, :create]
  resources :articles
  resources :tabs, only: [:index]
  resource :infinite_scrolls, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
