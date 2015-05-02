class RemoveUserIdFromChooseits < ActiveRecord::Migration
  def change
    remove_column :chooseits, :user_id
  end
end
