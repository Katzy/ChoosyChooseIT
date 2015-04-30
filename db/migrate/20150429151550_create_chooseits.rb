class CreateChooseits < ActiveRecord::Migration
  def change
    create_table :chooseits do |t|
      t.integer :author_id
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
