class ChooseitResponse < ActiveRecord::Base


  belongs_to :user
  belongs_to :chooseit_choice

  validates :chooseit_choice, presence: true
end
