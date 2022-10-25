class Product < ApplicationRecord
  has_many :product_models, dependent: :destroy
  accepts_nested_attributes_for :product_models, allow_destroy: true

  validates :name, presence: true
end
