class AddIndexToChooseits < ActiveRecord::Migration
  def change
    add_index :chooseits, [:author_id]
  end
end
