class UserMailer < ActionMailer::Base
  default from: "noreply@choosychooseit.com"



  def new_chooseit(user)
    @user = user
    mail(to: @user.email, subject: "#{@user.email} needs your opinion on something.  Help them ChooseIT!")
  end


end
