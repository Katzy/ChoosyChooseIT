class ChangeRespondentIdToUserIdChooseitResponses < ActiveRecord::Migration
  def change
    remove_column :chooseit_responses, :respondent_id

    add_column :chooseit_responses, :user_id, :integer
    add_index :chooseit_responses, [:chooseit_choice_id, :user_id], unique: true, :name => "chooseit_responses_index"
  end
end

