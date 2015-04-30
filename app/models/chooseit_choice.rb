class ChooseitChoice < ActiveRecord::Base
  
  belongs_to :chooseit

  validates, :choice1_description, presence: true, default: "", null: false
  validates, :choice2_description, presence: true, default: "", null: false

  has_attached_file :image
  
end
