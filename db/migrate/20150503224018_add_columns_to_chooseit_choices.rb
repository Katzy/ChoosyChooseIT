class AddColumnsToChooseitChoices < ActiveRecord::Migration
  def change
    add_column :chooseit_choices, :image_uid, :string
    add_column :chooseit_choices, :image_name, :string
  end
end
