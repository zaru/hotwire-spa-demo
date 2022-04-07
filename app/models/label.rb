class Label < ApplicationRecord
  has_many :item_labels
  has_many :items, through: :item_labels
end
