class CreateMatterComments < ActiveRecord::Migration[5.2]
  def change
    create_table :matter_comments do |t|
      t.integer :employee_id
      t.integer :matter_id
      t.text :comment

      t.timestamps
    end
  end
end
