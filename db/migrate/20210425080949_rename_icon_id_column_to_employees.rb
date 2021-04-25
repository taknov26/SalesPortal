class RenameIconIdColumnToEmployees < ActiveRecord::Migration[5.2]
  def change
    rename_column :employees, :icon_id, :image_id
  end
end
