class UsersController < ApplicationController



  def show
    # authorize! :read, @user
  end

  # GET /users/:id/edit
  def edit
    # authorize! :update, @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :guest_id, :uid, :image, :name, :provider)
  end
end
