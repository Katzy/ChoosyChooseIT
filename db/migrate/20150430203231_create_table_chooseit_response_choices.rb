class CreateTableChooseitResponseChoices < ActiveRecord::Migration
  def change
    create_table :chooseit_response_choices do |t|
      t.references :chooseit_choice, foreign_key: true
      t.references :chooseit_response, index: true, foreign_key: true
    end
  end
end
