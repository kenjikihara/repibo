class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to: contact.email,
    subject: "Re:piboへのお問い合わせが完了しました。"
  end
end
