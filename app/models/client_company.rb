class ClientCompany < ApplicationRecord
  has_many :clients
  has_many :matters
end
