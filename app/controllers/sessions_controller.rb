class SessionsController < Devise::SessionsController
  def destroy
    cookiesdelete(:user_id)
    flash[:success]= "Ciao!"
    redirect_to root_url
  end
end