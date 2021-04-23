class CreateClientComments < ActiveRecord::Migration[5.2]
  def change
    create_table :client_comments do |t|
      t.integer :employee_id
      t.integer :client_id
      t.text :comment

      t.timestamps
    end
  end
end
