class ChooseitChoice < ActiveRecord::Base

  dragonfly_accessor :image

  belongs_to :chooseit
  has_many   :chooseit_response_choices

  # validates  :description, presence: true, default: "", null: false

end
