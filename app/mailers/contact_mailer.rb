class ContactMailer < ActionMailer::Base

  default from: 'from@example.com'

  def new_contact_form(contact)
    @contact = contact
    mail(to: "buckleys78@gmail.com", from: @contact.email, subject: 'Portfolio Contact')
  end
end
