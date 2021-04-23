class CrientPerson < ApplicationRecord
  has_many :matters
  belongs_to :client
end
