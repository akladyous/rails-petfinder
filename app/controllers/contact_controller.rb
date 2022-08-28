class ContactController < ApplicationController
  def index
    @constrains = {
      name: { presence: { allowEmpty: false, message: "^Name name can't be blank" } },
      email: { presence: { allowEmpty: false, message: "^Email name can't be blank" },
               email: { message: 'Please enter a valid email' } },
      subject: { presence: { allowEmpty: false, message: "^Subject name can't be blank" } },
      message: { presence: { allowEmpty: false, message: "^Message name can't be blank" } }
    }
  end

  def create
    @contact = contact_params.to_h
    FeedbackMailer.send_feedback(@contact).deliver_now
    redirect_to root_path
  end

  def contact_params
    params.permit(:name, :email, :subject, :message)
  end
end
