class Cost < ApplicationRecord
  belongs_to :matter

  validates :item, presence: true
  validates :item_price, numericality: { only_integer: true }, presence: true

end
