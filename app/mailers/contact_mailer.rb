class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail to:  're.picture.books@gmail.com',
    subject: "Re:piboへのお問い合わせメール"
  end
end
