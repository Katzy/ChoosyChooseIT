class CreateChooseitResponses < ActiveRecord::Migration
  def change
    create_table :chooseit_responses do |t|
      t.integer    :respondent_id
      t.references :chooseit, foreign_key: true
      t.timestamps
    end
  end
end
