class Client < ApplicationRecord
  has_many :client_comments
  has_many :matters
  has_many :client_people
end
