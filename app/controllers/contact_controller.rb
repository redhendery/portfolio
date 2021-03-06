class ContactController < ApplicationController
  def index
    @contact = Contact.new(params[:contact])
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    # Prevent sending mail if ham_sandwich "honey pot" bot field completed
    if @contact.ham_sandwich.present?
      render :index
    else
      @contact.deliver
      flash[:success] = 'Thank you for your message! Red will get back to you soon'
      redirect_to root_url
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end

end
