class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :matters
  has_many :matter_comments
  has_many :client_comments
  attachment :image

  def self.guest
    find_or_create_by!(name: "ゲスト", name_kana: "ゲスト", telephone_number: "000-0000-0000", phone_extension: "1", belonging: "ゲスト", position: "ゲスト", email: "guest@example.com") do |employee|
      # employee.name = "ゲスト"
      # employee.name_kana = "ゲスト"
      # employee.telephone_number = "000-0000-0000"
      # employee.phone_extension = "1"
      # employee.bolonging = "所属"
      # employee.position = "ゲスト"
      employee.password = SecureRandom.urlsafe_base64
    end
  end

end
