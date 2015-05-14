class UserMailer < ActionMailer::Base
  default from: "noreply@choosychooseit.com"

  def new_chooseit(user, chooseit, chooseit_choice_1, chooseit_choice_2)
    @user = user
    @user.name = "noreply" if @user.name == nil
    @chooseit = chooseit
    @emails = @chooseit.emails.split(',')
    @chooseit_choice_1 = chooseit_choice_1
    @chooseit_choice_2 = chooseit_choice_2
    # attachments.inline['image_1.png'] = File.read('public/system/dragonfly/#{@chooseit_choice_1.image}')
    # attachments.inline['image_2.png'] = File.read('public/system/dragonfly/#{@chooseit_choice_2.image}')
    mail(to: @emails, from: (@user.name.delete(" ") + "@choosychooseit.com"), subject: "#{@user.name} needs your opinion on something.  You've been summoned to ChooseIT!")
  end


end
