class WelcomeController<ApplicationController

  before_action :current_user

  def index

    @user = current_user
  end

end
