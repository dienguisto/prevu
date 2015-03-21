class ContactsController < ApplicationController
  before_action :set_owner, only: [:new, :create]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.owner = @owner

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @url_back, notice: 'Contact ajouté avec succés.' }
        format.json { render :show, status: :created, location: @contact.owner }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_owner
    @owner = params[:owner_type].constantize.find(params[:owner_id])
    @url_back = params[:url_back]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:nom, :prenom, :telephone, :adresse, :titre, :email)
  end
end
