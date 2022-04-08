class ItemLabel < ApplicationRecord
  belongs_to :item
  belongs_to :label

  validates :item_id, uniqueness: { scope: :label_id }
end
