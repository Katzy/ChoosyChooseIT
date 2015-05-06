class AddIndexChooseitsSlug < ActiveRecord::Migration
  def change
    add_index :chooseits, :slug
  end
end
