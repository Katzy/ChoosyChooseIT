class RemoveForeignKeyChooseits < ActiveRecord::Migration
  def change
    remove_foreign_key :chooseits, :users
    remove_index :chooseits, [:user_id]
  end
end
