class ChooseitResponseChoices < ActiveRecord::Base

  belongs_to :chooseit, through: => :chooseit_choice
  belongs_to :chooseit_responses
  belongs_to :user, through: => :chooseit_response

end
