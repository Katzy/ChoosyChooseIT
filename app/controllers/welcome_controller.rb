class WelcomeController<ApplicationController

  def index
    @user = User.find_by(params[:guest_id])
  end

end
