class MessageMailer < ApplicationMailer
  def message_mail(message)
    @message = message
    mail to: message.book.user.email,
    subject: "投稿した絵本へのメッセージが届きました"
  end
end
