class Client < ApplicationRecord
  has_many :client_comments
  has_many :matters
  has_many :client_people
  belongs_to :client_company

  validates :branch_name, presence: true, uniqueness: true
  validates :telephone_number, presence: true
  validates :address, presence: true

end
