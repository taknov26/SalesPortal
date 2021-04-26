class ClientPerson < ApplicationRecord
  has_many :matters
  belongs_to :client
end
