class CreateCrientPeople < ActiveRecord::Migration[5.2]
  def change
    create_table :crient_people do |t|
      t.integer :client_id
      t.string :name
      t.string :department
      t.string :telephone_number
      t.string :email
      t.string :status, default: "0"
      t.timestamps
    end
  end
end
