class CreateCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :costs do |t|
      t.integer :matter_id
      t.string :item
      t.integer :item_price
      t.timestamps
    end
  end
end
