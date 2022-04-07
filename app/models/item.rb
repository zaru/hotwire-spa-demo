class Item < ApplicationRecord
  has_many :item_labels
  has_many :labels, through: :item_labels
end
