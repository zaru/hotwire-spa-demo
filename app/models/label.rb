class Label < ApplicationRecord
  has_many :item_labels
  has_many :items, through: :item_labels
  accepts_nested_attributes_for :item_labels
end
