class FormulesController < ApplicationController
  before_action :set_formule, only: [:show, :edit, :update, :destroy]

  # GET /formules
  # GET /formules.json
  def index
    @formules = Formule.all
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
    # Use callbacks to share common setup or constraints between actions.
    def set_formule
      @formule = Formule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formule_params
      params.require(:formule).permit(:nom, :montant_adhesion, :montant_cotisation, :periode, :occurrence_periode)
    end
end
