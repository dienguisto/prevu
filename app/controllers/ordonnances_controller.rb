class OrdonnancesController < ApplicationController
  before_action :only_for_pharmacie!
  before_action :set_adherent
  before_action :set_ordonnance, only: [:show, :edit, :update, :destroy, :facture]
  before_action :set_confirm_details, only: [:confirm]

  # GET /ordonnances
  # GET /ordonnances.json
  def index
    if current_user.user_system?
      @ordonnances = Ordonnance.all
    else
      @ordonnances = current_pharmacy.ordonnances
    end
  end

  # GET /ordonnances/1
  # GET /ordonnances/1.json
  def show
  end

  def facture
    render :layout => false
  end

  # GET /ordonnances/new
  def new
    @ordonnance = Ordonnance.new
    @ordonnance.detail_ordonnances = []
    2.times{ @ordonnance.detail_ordonnances << DetailOrdonnance.new }
  end

  def confirm
    @ordonnance = Ordonnance.new(ordonnance_params)
    @ordonnance.adherent = @adherent
    @ordonnance.pharmacy = current_pharmacy
    unless @ordonnance.valid?
      flash[:error] = "Une erreur est survenur lors de l'ajout de l'ordonnance"
      render :new
    end
  end

  def set_confirm_details
    tab = []
    results = {}
    details = {}
    details = ordonnance_params[:detail_ordonnances_attributes]
    details.each do |k, v|
      if tab.include?(v['medicament_id'])
        print v['medicament_id']
        results[v['medicament_id']]['quantite'] = v['quantite'].to_i + results[v['medicament_id']]['quantite'].to_i
      else
        tab << v['medicament_id']
        results[v['medicament_id']] = v
      end
    end
    params[:ordonnance][:detail_ordonnances_attributes] = results
  end

  # GET /ordonnances/1/edit
  def edit
  end

  # POST /ordonnances
  # POST /ordonnances.json
  def create
    @ordonnance = Ordonnance.new(ordonnance_params)
    @ordonnance.adherent = @adherent
    @ordonnance.pharmacy = current_pharmacy

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
    def set_adherent
      @adherent = Adherent.find(params[:adherent_id]) unless params[:adherent_id].nil?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_ordonnance
      @ordonnance = Ordonnance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordonnance_params
      params.require(:ordonnance).permit(:prix_total,
                                         :detail_ordonnances_attributes =>[:prix_unitaire, :quantite, :medicament_id])
    end
end
