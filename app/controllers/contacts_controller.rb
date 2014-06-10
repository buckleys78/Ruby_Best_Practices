class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new secure_params
    if @contact.valid?
      ContactMailer.new_contact_form(@contact).deliver
      redirect_to root_path
      flash[:notice]= "Your message has been sent."
    else
      render :new
      flash[:notice]= "Failed to send email."
    end
  end

private

  def secure_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
