class WelcomeController<ApplicationController



  def index
    if user_signed_in?
      if current_user != nil
        @user = current_user
      else
        @user = guest_user
      end
      p @user.email
      @chooseits = @user.chooseits
    end
  end

end
