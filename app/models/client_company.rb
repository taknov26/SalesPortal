class ClientCompany < ApplicationRecord
  has_many :clients
  has_many :matters

  validates :name, presense: true, uniqueness: true

end
