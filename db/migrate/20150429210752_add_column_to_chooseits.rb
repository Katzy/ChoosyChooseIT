class AddColumnToChooseits < ActiveRecord::Migration
  def change
    add_column :chooseits, :genres, :string, default: "", null: false
  end
end
