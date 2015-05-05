class FormationSanitairesController < ApplicationController
  before_action :set_formation_sanitaire, only: [:show, :edit, :update, :destroy]

  # GET /formation_sanitaires
  # GET /formation_sanitaires.json
  def index
    @search = FormationSanitaire.ransack(params[:q])
    @formation_sanitaires = @search.result.page params[:page]
  end

  # GET /formation_sanitaires/1
  # GET /formation_sanitaires/1.json
  def show
  end

  # GET /formation_sanitaires/new
  def new
    @formation_sanitaire = FormationSanitaire.new
    @formation_sanitaire.build_structure_sanitaire
  end

  # GET /formation_sanitaires/1/edit
  def edit
  end

  # POST /formation_sanitaires
  # POST /formation_sanitaires.json
  def create
    @formation_sanitaire = FormationSanitaire.new(formation_sanitaire_params)

    respond_to do |format|
      if @formation_sanitaire.save
        format.html { redirect_to @formation_sanitaire, notice: 'FormationSanitaire was successfully created.' }
        format.json { render :show, status: :created, location: @formation_sanitaire }
      else
        format.html { render :new }
        format.json { render json: @formation_sanitaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formation_sanitaires/1
  # PATCH/PUT /formation_sanitaires/1.json
  def update
    respond_to do |format|
      if @formation_sanitaire.update(formation_sanitaire_params)
        format.html { redirect_to @formation_sanitaire, notice: 'FormationSanitaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @formation_sanitaire }
      else
        format.html { render :edit }
        format.json { render json: @formation_sanitaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formation_sanitaires/1
  # DELETE /formation_sanitaires/1.json
  def destroy
    @formation_sanitaire.destroy
    respond_to do |format|
      format.html { redirect_to formation_sanitaires_url, notice: 'FormationSanitaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formation_sanitaire
      @formation_sanitaire = FormationSanitaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formation_sanitaire_params
      params.require(:formation_sanitaire).permit(:niveau, structure_sanitaire_attributes: [:id, :nom, :adresse, :date_adhesion, :logo])
    end
end
