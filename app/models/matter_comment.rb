class MatterComment < ApplicationRecord
  belongs_to :employee
  belongs_to :matter

  validates :comment, presence: true

end
