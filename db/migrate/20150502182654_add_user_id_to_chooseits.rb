class AddUserIdToChooseits < ActiveRecord::Migration
  def change
    add_column :chooseits, :user_id, :integer
  end
end
