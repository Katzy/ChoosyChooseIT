class ChooseitChoice < ActiveRecord::Base

  dragonfly_accessor :image

  belongs_to :chooseit
  has_many   :chooseit_responses, dependent: :destroy
  has_many   :users, through: :chooseit_responses

  # validates  :description, presence: true, default: "", null: false

end
