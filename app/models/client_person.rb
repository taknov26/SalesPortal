class ClientPerson < ApplicationRecord
  has_many :matters
  belongs_to :client

  validates :name, presence: true
  validates :department, presence: true
  validates :telephone_number, presence: true
  
end
