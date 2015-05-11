class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :except => :receive_guest

  include ApplicationHelper

  before_action :current_or_guest_user

#   def initialize_chooseits
#     if current_user != nil
#       @chooseits = current_user.chooseits
#     else
#       guest_user
#       @chooseits = guest_user.chooseits
#     end
#   end
end