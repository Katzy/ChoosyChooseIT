class CreateChooseitChoices < ActiveRecord::Migration
  def change
    create_table :chooseit_choices do |t|
      t.string :description
      t.references :chooseit, index: true, foreign_key: true
    end
  end
end
