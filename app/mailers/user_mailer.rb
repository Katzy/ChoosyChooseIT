class UserMailer < ActionMailer::Base
  default from: "noreply@choosychooseit.com"



  def new_chooseit(user, chooseit, chooseit_choice_1, chooseit_choice_2)
    @user = user
    @chooseit = chooseit
    @chooseit_choice_1 = chooseit_choice_1
    @chooseit_choice_2 = chooseit_choice_2
    mail(to: @user.email, subject: "#{@user.email} needs your opinion on something.  Help them ChooseIT!")
  end


end
