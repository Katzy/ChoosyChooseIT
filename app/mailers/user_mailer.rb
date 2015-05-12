class UserMailer < ActionMailer::Base
  default from: "noreply@choosychooseit.com"

  def new_chooseit(user, chooseit, chooseit_choice_1, chooseit_choice_2)
    @user = user
    @chooseit = chooseit
    @emails = @chooseit.emails.split(',')
    @chooseit_choice_1 = chooseit_choice_1
    @chooseit_choice_2 = chooseit_choice_2
    mail(to: @emails, subject: "#{@user.name} needs your opinion on something.  You've been summoned to ChooseIT!")
  end


end
