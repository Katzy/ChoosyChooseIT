class CreateChooseitResponseChoices < ActiveRecord::Migration
  def change
    create_table :chooseit_response_choices do |t|
      t.references :chooseit_choices, foreign_key: true
      t.references :chooseit_responses, index: true, foreign_key: true
    end
  end

  def change
    add_foreign_key :chooseits, :users, column:  :author_id
  end
end
