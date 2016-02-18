class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      UserMailer.contact_email(@contact).deliver
      redirect_to root_path, notice: "Thank you for your message!"
    else
      render :new, alert: "Message failed to send." 
    end
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
