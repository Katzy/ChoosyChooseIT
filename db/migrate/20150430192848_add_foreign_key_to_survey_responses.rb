class AddForeignKeyToSurveyResponses < ActiveRecord::Migration
  def change
    add_foreign_key :chooseit_responses, :users, column:  :respondent_id
  end
end
