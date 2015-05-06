class AddSlugToChooseits < ActiveRecord::Migration
  def change
    add_column :chooseits, :slug, :string, unique: true
  end
end
