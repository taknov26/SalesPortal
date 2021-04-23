class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.integer :client_company_id
      t.string :branch_name
      t.string :address
      t.string :telephone_number

      t.timestamps
    end
  end
end
