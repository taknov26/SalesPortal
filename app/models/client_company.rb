class ClientCompany < ApplicationRecord
  has_many :clients
  has_many :matters

  validates :name, presence: true, uniqueness: true

end
