class CreateMatters < ActiveRecord::Migration[5.2]
  def change
    create_table :matters do |t|
      t.integer :employee_id
      t.integer :client_company_id
      t.integer :client_id
      t.integer :client_person_id
      t.string :name
      t.integer :price
      t.integer :status, default: "0"
      t.string :file_id
      t.date :fixed_date
      t.timestamps
    end
  end
end
