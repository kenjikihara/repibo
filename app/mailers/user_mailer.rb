class UserMailer < ApplicationMailer
  def user_mail(user)
    @user = user

    mail to: user.email , subject: "Re:piboへの登録が完了しました"
  end
end
