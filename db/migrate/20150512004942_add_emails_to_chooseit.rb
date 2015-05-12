class ChangeRespondentIdToUserIdChooseitResponses < ActiveRecord::Migration
  def change

    add_column :chooseits, :emails, :string

  end
end

