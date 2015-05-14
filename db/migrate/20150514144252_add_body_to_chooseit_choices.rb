class AddBodyToChooseitChoices < ActiveRecord::Migration
  def change
    add_column :chooseit_choices, :body, :string
  end
end
