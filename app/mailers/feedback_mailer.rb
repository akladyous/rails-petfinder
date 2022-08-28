class FeedbackMailer < ApplicationMailer
  def send_feedback(contact)
    @contact = contact
    mail to: contact[:email], subject: 'Petfinder: Your feedback'
  end
end
