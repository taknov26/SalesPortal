class Matter < ApplicationRecord
  belongs_to :employee
  has_many :costs
  belongs_to :client
  belongs_to :client_company
  belongs_to :client_person
  has_many :matter_comments
end
