class ChangeColumnUsersGuestId < ActiveRecord::Migration
  def change
    change_column :users, :guest_id, :string
  end
end
