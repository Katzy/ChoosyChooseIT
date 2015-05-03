class AddUniqueIndexChooseitResponseChoices < ActiveRecord::Migration
  def change
    add_index :chooseit_response_choices, [:chooseit_choice_id, :chooseit_response_id], unique: true, :name => "chooseit_response_choices_index"
  end
end
