class AddColumnToChooseit < ActiveRecord::Migration
  def change
    add_column :chooseits, :short_name, :string
  end
end
