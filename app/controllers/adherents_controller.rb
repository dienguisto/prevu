class AdherentsController < ApplicationController
  before_action :not_for_structure_sanitaire!, except: [:show, :index]
  before_action :only_for_structure_asssurance!, only: [:new, :create, :destroy, :edit, :activate, :desactivate]
  before_action :set_adherent, only: [:show, :edit, :update, :destroy, :activate, :desactivate, :new_parrainage]

  def new
    @adherent = Adherent.new
    @adherent.contacts.build
    @adherent.souscriptions.build
    render layout: 'empty' unless user_signed_in?
  end

  def new_parrainage
    @adherent = Adherent.new
    @adherent.contacts.build
    @adherent.souscriptions.build
  end

  def signin
    @adherent = Adherent.new(params[:adherent])
    if @adherent.save
      redirect_to root_url, :notice => 'Signed up!'
    else
      render 'new', layout: 'empty'
    end
  end

  # GET /adherents
  # GET /adherents.json
  def index
    @adherents = Adherent.none.page params[:page]
    @ids = []
    if current_user.user_structure_assurance?
      @adherents = current_structure_assurance.adherents.order(:id).page params[:page]
    elsif current_user.user_system?
      @adherents = Adherent.all.order(:id).page params[:page]
    end
    if params[:q]
      @q = Adherent.find_by(params[:q])
      @adherent = @q#.result
      if @adherent
        redirect_to @adherent
      end
    end
  end

  # GET /adherents/1
  # GET /adherents/1.json
  def show
  end

  def carte_assurances
    @adherents = []
    if params[:id] or params[:adherent_id]
      @adherents << Adherent.find(params[:id] || params[:adherent_id])
    elsif params[:ids]
      params[:ids].each do |i|
        @adherents << Adherent.find(i)
      end
    end
    render :layout => false
  end

  # GET /adherents/1/edit
  def edit
  end

  def edit_parrainage
    @adherent = Adherent.find(params[:adherent_id])
  end

  # POST /adherents
  # POST /adherents.json
  def create
    @adherent = Adherent.new(adherent_params)
    @adherent.structure_assurance = current_structure_assurance
    generated_password = Devise.friendly_token.first(8)
    @adherent.password_digest = generated_password

    respond_to do |format|
      if @adherent.save
        format.html { redirect_to @adherent, notice: 'Adherent was successfully created.' }
        format.json { render :show, status: :created, location: @adherent }
      else
        format.html { render :new }
        format.json { render json: @adherent.errors, status: :unprocessable_entity }
      end
    end
  end

  def affiliers
    @adherents = Adherent.where(parrain: params[:adherent_id]).order(:id).page params[:page]
  end

  # PATCH/PUT /adherents/1
  # PATCH/PUT /adherents/1.json
  def update
    respond_to do |format|
      if @adherent.update(adherent_params)
        format.html { redirect_to @adherent, notice: 'Adherent was successfully updated.' }
        format.json { render :show, status: :ok, location: @adherent }
      else
        format.html { render :edit }
        format.json { render json: @adherent.errors, status: :unprocessable_entity }
      end
    end
  end

  def activate
    @adherent.update(status: 2, last_activation: Time.now)
    redirect_to @adherent
  end

  def desactivate
    @adherent.update(status: 3, last_suspension: Time.now)
    redirect_to @adherent
  end

  # DELETE /adherents/1
  # DELETE /adherents/1.json
  def destroy
    @adherent.status = 4
    @adherent.last_delete = Time.now
    @adherent.save
    respond_to do |format|  
      format.html { redirect_to adherents_url, notice: 'Adherent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adherent
      @adherent = Adherent.find(params[:id] || params[:adherent_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adherent_params
      params.require(:adherent).permit(:nom, :prenom, :email, :status_matrimonial, :date_de_naissance, :lieu_de_naissance,
                                       :type_piece_identite, :numero_piece_identite,:avatar, :groupe_id,
                                       :sexe, :parrain_id, :affiliation, :structure_assurance_id,
                                       contacts_attributes: [:telephone, :adresse, :email],
                                       souscriptions_attributes: [:formule_id, :paye, :date_expiration])
    end
end
