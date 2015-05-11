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
    @ids = []
    if current_user.user_structure_assurance?
      @search = current_structure_assurance.adherents.ransack(params[:q])
      @adherents = @search.result.order(:id).page params[:page]
    elsif current_user.user_system?
      @search = Adherent.ransack(params[:q])
      @adherents =  @search.result.order(:structure_assurance_id).page params[:page]
    else
      @search = Adherent.ransack(params[:q])
      @adherents =  @search.result.page params[:page]
    end

    if params[:qq]
      if current_user.user_structure_assurance?
        @q = current_structure_assurance.adherents.where('matricule=? or numero_police=?', params[:qq], params[:qq]).first
      else
        @q = Adherent.find_by(params[:qq])
      end

      if @q
        redirect_to @q
      end
    end
  end

  # GET /adherents/1
  # GET /adherents/1.json
  def show
    if current_user.user_structure_assurance? and @adherent.structure_assurance != current_structure_assurance
      redirect_to_error
    end
  end

  def carte_assurances
    @adherents = []
    if params[:id] or params[:adherent_id]
      a = Adherent.find(params[:id] || params[:adherent_id])
      if a.souscription_en_cours
        @adherents << a
      end
    elsif params[:ids]
      #@adherents += params[:ids].map { |i| Adherent.where('id=? and numero_police!=?', i, '').
      #    where.not(structure_assurance_id: nil).first }
      params[:ids].each do |i|
        a = Adherent.find(i)
        if a and a.souscription_en_cours
          @adherents << a
        end
      end
    else
      render adherents_path
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
                                       :type_piece_identite, :numero_piece_identite,:avatar, :groupe_id, :profession,
                                       :sexe, :parrain_id, :affiliation, :structure_assurance_id, :numero_assurance,
                                       :numero_police, contacts_attributes: [:telephone, :adresse, :email],
                                       souscriptions_attributes: [:formule_id, :paye, :date_expiration, :numero_police])
    end
end
