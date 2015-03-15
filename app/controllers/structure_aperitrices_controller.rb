class StructureAperitricesController < ApplicationController
  before_action :set_structure_aperitrice, only: [:show, :edit, :update, :destroy]

  # GET /structure_aperitrices
  # GET /structure_aperitrices.json
  def index
    @structure_aperitrices = StructureAperitrice.all
  end

  # GET /structure_aperitrices/1
  # GET /structure_aperitrices/1.json
  def show
  end

  # GET /structure_aperitrices/new
  def new
    @structure_aperitrice = StructureAperitrice.new
  end

  # GET /structure_aperitrices/1/edit
  def edit
  end

  # POST /structure_aperitrices
  # POST /structure_aperitrices.json
  def create
    @structure_aperitrice = StructureAperitrice.new(structure_aperitrice_params)

    respond_to do |format|
      if @structure_aperitrice.save
        format.html { redirect_to @structure_aperitrice, notice: 'Structure aperitrice was successfully created.' }
        format.json { render :show, status: :created, location: @structure_aperitrice }
      else
        format.html { render :new }
        format.json { render json: @structure_aperitrice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /structure_aperitrices/1
  # PATCH/PUT /structure_aperitrices/1.json
  def update
    respond_to do |format|
      if @structure_aperitrice.update(structure_aperitrice_params)
        format.html { redirect_to @structure_aperitrice, notice: 'Structure aperitrice was successfully updated.' }
        format.json { render :show, status: :ok, location: @structure_aperitrice }
      else
        format.html { render :edit }
        format.json { render json: @structure_aperitrice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /structure_aperitrices/1
  # DELETE /structure_aperitrices/1.json
  def destroy
    @structure_aperitrice.destroy
    respond_to do |format|
      format.html { redirect_to structure_aperitrices_url, notice: 'Structure aperitrice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structure_aperitrice
      @structure_aperitrice = StructureAperitrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def structure_aperitrice_params
      params.require(:structure_aperitrice).permit(:nom, :adresse, :date_adhesion)
    end
end
