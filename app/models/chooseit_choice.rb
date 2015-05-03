class ChooseitChoice < ActiveRecord::Base

  belongs_to :chooseit
  has_many   :chooseit_response_choices
  has_one    :attachment

  validates  :description, presence: true, default: "", null: false
  # validates  :choice2_description, presence: true, default: "", null: false


end
