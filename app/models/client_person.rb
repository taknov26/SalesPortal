class ClientPerson < ApplicationRecord
  has_many :matters
  belongs_to :client

  validates :name, presense: true
  validates :department, presense: true
  validates :telephone_number, presense: true
  
end
