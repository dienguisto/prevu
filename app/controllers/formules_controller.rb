class FormulesController < ApplicationController
  before_action :only_for_structure_asssurance!
  before_action :set_formule, only: [:show, :edit, :update, :destroy, :ajouter_structure_sanitaire, :activer_structure_sanitaire, :desactiver_structure_sanitaire]
  before_action :set_structure_sanitaire, only: [:ajouter_structure_sanitaire, :activer_structure_sanitaire, :desactiver_structure_sanitaire]

  def ajouter_structure_sanitaire
    @formule.ajouter_structure_sanitaire!(@structure_sanitaire)
    redirect_to @formule
  end

  def activer_structure_sanitaire
    formule_structure_sanitaire = @formule.formule_structure_sanitaires.find_by(structure_sanitaire: @structure_sanitaire)
    formule_structure_sanitaire.activate!
    redirect_to @formule
  end

  def desactiver_structure_sanitaire
    formule_structure_sanitaire = @formule.formule_structure_sanitaires.find_by(structure_sanitaire: @structure_sanitaire)
    formule_structure_sanitaire.desactivate!
    redirect_to @formule
  end

  # GET /formules
  # GET /formules.json
  def index
    @formules = current_structure_assurance.formules.order(:id).page params[:page]
  end

  # GET /formules/1
  # GET /formules/1.json
  def show
  end

  # GET /formules/new
  def new
    @formule = Formule.new
  end

  # GET /formules/1/edit
  def edit
  end

  # POST /formules
  # POST /formules.json
  def create
    @formule = Formule.new(formule_params)
    @formule.structure_assurance = current_structure_assurance

    respond_to do |format|
      if @formule.save
        format.html { redirect_to @formule, notice: 'Formule was successfully created.' }
        format.json { render :show, status: :created, location: @formule }
      else
        format.html { render :new }
        format.json { render json: @formule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formules/1
  # PATCH/PUT /formules/1.json
  def update
    respond_to do |format|
      if @formule.update(formule_params)
        format.html { redirect_to @formule, notice: 'Formule was successfully updated.' }
        format.json { render :show, status: :ok, location: @formule }
      else
        format.html { render :edit }
        format.json { render json: @formule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formules/1
  # DELETE /formules/1.json
  def destroy
    @formule.destroy
    respond_to do |format|
      format.html { redirect_to formules_url, notice: 'Formule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_structure_sanitaire
      @structure_sanitaire = StructureSanitaire.find(params[:id_structure])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_formule
      @formule = Formule.find(params[:id] || params[:formule_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formule_params
      params.require(:formule).permit(:nom, :montant_adhesion, :montant_cotisation, :ticket_moderateur, :periode, :occurrence_periode)
    end
end
