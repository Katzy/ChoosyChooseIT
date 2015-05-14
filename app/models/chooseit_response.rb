class ChooseitResponse < ActiveRecord::Base


  belongs_to :user
  belongs_to :chooseit_choice
  belongs_to :chooseit
  validates :chooseit_choice, presence: true


end
