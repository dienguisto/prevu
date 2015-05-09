class SouscriptionsController < ApplicationController
  before_action :only_for_structure_asssurance!
  before_action :set_souscription, only: [:show, :edit, :update, :destroy, :activer, :desactiver]
  before_action :set_adherent

  def activer
    @souscription.activate!
    flash[:notice] = 'Souscription activée'
    redirect_to @souscription.adherent
  end

  def desactiver
    @souscription.desactivate!
    flash[:notice] = 'Souscription desactivée'
    redirect_to @souscription.adherent
  end

  # GET /souscriptions
  # GET /souscriptions.json
  def index
    @souscriptions = Souscription.all
  end

  # GET /souscriptions/1
  # GET /souscriptions/1.json
  def show
  end

  # GET /souscriptions/new
  def new
    @souscription = Souscription.new
  end

  # GET /souscriptions/1/edit
  def edit
  end

  # POST /souscriptions
  # POST /souscriptions.json
  def create
    @souscription = Souscription.new(souscription_params)
    @souscription.adherent = @adherent

    respond_to do |format|
      if @souscription.save
        format.html { redirect_to @adherent, notice: 'Souscription was successfully created.' }
        format.json { render :show, status: :created, location: @souscription }
      else
        format.html { render :new }
        format.json { render json: @souscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /souscriptions/1
  # PATCH/PUT /souscriptions/1.json
  def update
    respond_to do |format|
      if @souscription.update(souscription_params)
        format.html { redirect_to @adherent, notice: 'Souscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @souscription }
      else
        format.html { render :edit }
        format.json { render json: @souscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /souscriptions/1
  # DELETE /souscriptions/1.json
  def destroy
    @souscription.destroy
    respond_to do |format|
      format.html { redirect_to souscriptions_url, notice: 'Souscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_souscription
    @souscription = Souscription.find(params[:id] || params[:souscription_id])
  end

  def set_adherent
    @adherent = Adherent.find(params[:adherent_id]) unless params[:adherent_id].empty?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def souscription_params
    params.require(:souscription).permit(:adherent_id, :formule_id, :paye, :date_paiement,
                                         :actif, :date_expiration)
  end
end
