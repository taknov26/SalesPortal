class Cost < ApplicationRecord
  belongs_to :matter

  validates :item, presense: true
  validates :item_price,numericality: { only_integer: true }, presense: true

end
