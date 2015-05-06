class FixForeignKeyReferencesChooseits < ActiveRecord::Migration
  def change

    remove_column :chooseits, :author_id
    add_index :chooseits, :user_id
  end
end
