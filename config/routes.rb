Rails.application.routes.draw do
  resources :items
  resources :item_labels
  resources :pages
  resource :page_previews, only: [:show, :create]
  resources :articles
  resources :tabs, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
