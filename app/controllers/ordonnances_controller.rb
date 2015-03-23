class OrdonnancesController < ApplicationController
  before_action :only_for_pharmacie!
  before_action :set_ordonnance, only: [:show, :edit, :update, :destroy]

  # GET /ordonnances
  # GET /ordonnances.json
  def index
    @ordonnances = Ordonnance.all
  end

  # GET /ordonnances/1
  # GET /ordonnances/1.json
  def show
  end

  # GET /ordonnances/new
  def new
    @ordonnance = Ordonnance.new
    @ordonnance.detail_ordonnances = []
    2.times{ @ordonnance.detail_ordonnances << DetailOrdonnance.new }
  end

  def confirm
    @ordonnance = Ordonnance.new(ordonnance_params)
  end

  # GET /ordonnances/1/edit
  def edit
  end

  # POST /ordonnances
  # POST /ordonnances.json
  def create
    @url_back = params[:url_back]
    @ordonnance = Ordonnance.new(ordonnance_params)

    respond_to do |format|
      if @ordonnance.save

        format.html { redirect_to @ordonnance.adherent, notice: 'Ordonnance was successfully created.' }
        format.json { render :show, status: :created, location: @ordonnance }
      else
        format.html { render :new }
        format.json { render json: @ordonnance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordonnances/1
  # PATCH/PUT /ordonnances/1.json
  def update
    respond_to do |format|
      if @ordonnance.update(ordonnance_params)
        format.html { redirect_to @ordonnance, notice: 'Ordonnance was successfully updated.' }
        format.json { render :show, status: :ok, location: @ordonnance }
      else
        format.html { render :edit }
        format.json { render json: @ordonnance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordonnances/1
  # DELETE /ordonnances/1.json
  def destroy
    @ordonnance.destroy
    respond_to do |format|
      format.html { redirect_to ordonnances_url, notice: 'Ordonnance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordonnance
      @ordonnance = Ordonnance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordonnance_params
      params.require(:ordonnance).permit(:prix_total, :adherent_id, :pharmacy_id,
                                         :detail_ordonnances_attributes =>[:prix_unitaire, :quantite, :medicament_id])
    end
end
