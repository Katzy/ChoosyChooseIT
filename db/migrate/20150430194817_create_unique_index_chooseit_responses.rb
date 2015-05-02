class CreateUniqueIndexChooseitResponses < ActiveRecord::Migration
  def change
    add_index :chooseit_responses, [:chooseit_id, :respondent_id], unique: true
    add_index :chooseit_responses, [:respondent_id]
  end
end
