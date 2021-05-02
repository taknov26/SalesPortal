class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :matters
  has_many :matter_comments
  has_many :client_comments
  attachment :image

  # enum is_ative: { "在職": true, "退職": false }
  # enum role: { "一般": 1, "管理職": 99 }

end
