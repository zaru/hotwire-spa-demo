class ItemLabel < ApplicationRecord
  belongs_to :item
  belongs_to :label
end
