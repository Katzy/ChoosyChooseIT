class ChangeIndexesChooseitResponses < ActiveRecord::Migration
  def change
    remove_index :chooseit_responses, [:respondent_id]
    remove_index :chooseit_responses, [:chooseit_id, :respondent_id]
    add_column   :chooseit_responses, :chooseit_choice_id, :integer
    add_index    :chooseit_responses, [:chooseit_choice_id, :respondent_id], unique: true, :name => "chooseit_response_choices_index"
  end
end
