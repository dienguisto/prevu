class ConsultationsController < ApplicationController
  before_action :set_adherent
  before_action :only_for_formation_sanitaire!, except: [:index, :show]
  before_action :set_consultation, only: [:show, :edit, :update, :destroy, :facture]

  # GET /consultations
  # GET /consultations.json
  def index
    if current_user.user_system?
      @consultations = Consultation.all
    else
      @consultations = current_adherent.consultations
    end
  end

  # GET /consultations/1
  # GET /consultations/1.json
  def show
  end

  # GET /consultations/new
  def new
    @consultation = Consultation.new
  end

  def confirm
    @consultation = Consultation.new(consultation_params)
    @consultation.adherent = @adherent
    @consultation.formation_sanitaire = current_formation_sanitaire
    unless @consultation.valid?
      flash[:error] = "Une erreur est survenur lors de l'ajout de la consultation"
      render :new
    end
  end

  # GET /consultations/1/edit
  def edit
  end

  def facture
    render :layout => false
  end

  # POST /consultations
  # POST /consultations.json
  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.adherent = @adherent
    @consultation.formation_sanitaire = current_formation_sanitaire

    respond_to do |format|
      if @consultation.save
        format.html { redirect_to @consultation.adherent, notice: 'Consultation was successfully created.' }
        format.json { render :show, status: :created, location: @consultation }
      else
        format.html { render :new }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consultations/1
  # PATCH/PUT /consultations/1.json
  def update
    respond_to do |format|
      if @consultation.update(consultation_params)
        format.html { redirect_to @consultation, notice: 'Consultation was successfully updated.' }
        format.json { render :show, status: :ok, location: @consultation }
      else
        format.html { render :edit }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultations/1
  # DELETE /consultations/1.json
  def destroy
    @consultation.destroy
    respond_to do |format|
      format.html { redirect_to consultations_url, notice: 'Consultation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultation
      @consultation = Consultation.find(params[:id] || params[:consultation_id])
    end

    def set_adherent
      @adherent = Adherent.find(params[:adherent_id]) unless params[:adherent_id].nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consultation_params
      params.require(:consultation).permit(:description, :montant_total, :type_acte_medical_id, :origine_id, :date_referencement)
    end
end
