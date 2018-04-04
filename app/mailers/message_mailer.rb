class MessageMailer < ApplicationMailer
  def message_mail(message)
    @message = message
    mail to: message.book.user.email
  end
end
