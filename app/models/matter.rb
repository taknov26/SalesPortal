class Matter < ApplicationRecord
  belongs_to :employee
  has_many :costs
  belongs_to :client
  belongs_to :client_company
  belongs_to :client_person
  has_many :matter_comments

  enum status: { "見積り": 0, "受注": 1, "納品済": 2, "請求済": 3, "確定": 4 }
end

