class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: 're.picture.books@gmail.com'
  end
end
