class Client < ApplicationRecord
  has_many :client_comments
  has_many :matters
  has_many :client_people
  belongs_to :client_company

  validates :branch_name, presense: true, uniqueness: true
  validates :telephone_number, presense: true
  validates :address, presense: true

end
