class UserMailer < ApplicationMailer
    def user_mail(user)
      @user = user

      mail to: user.email , subject: "お問い合わせの確認メール"
    end
end
