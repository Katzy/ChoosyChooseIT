class ChooseitResponseChoices < ActiveRecord::Base

  has_one :chooseit, through: :chooseit_choice
  belongs_to :chooseit_responses
  has_one :user, through: :chooseit_response

end
