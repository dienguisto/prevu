class MedicamentsController < ApplicationController
  before_action :set_medicament, only: [:show, :edit, :update, :destroy, :activer, :desactiver]

  # GET /medicaments
  # GET /medicaments.json
  def index
    @medicaments = Medicament.all
  end

  # GET /medicaments/1
  # GET /medicaments/1.json
  def show
  end

  # GET /medicaments/new
  def new
    @medicament = Medicament.new
  end

  # GET /medicaments/1/edit
  def edit
  end

  # POST /medicaments
  # POST /medicaments.json
  def create
    @medicament = Medicament.new(medicament_params)

    respond_to do |format|
      if @medicament.save
        format.html { redirect_to medicaments_path, notice: 'Medicament was successfully created.' }
        format.json { render :show, status: :created, location: @medicament }
      else
        format.html { render :new }
        format.json { render json: @medicament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicaments/1
  # PATCH/PUT /medicaments/1.json
  def update
    respond_to do |format|
      if @medicament.update(medicament_params)
        format.html { redirect_to medicaments_path, notice: 'Medicament was successfully updated.' }
        format.json { render :show, status: :ok, location: @medicament }
      else
        format.html { render :edit }
        format.json { render json: @medicament.errors, status: :unprocessable_entity }
      end
    end
  end

  def activer
    @medicament.activate!
    flash[:notice] = 'Medicament activé'
    redirect_to @medicament
  end

  def desactiver
    @medicament.desactivate!
    flash[:notice] = 'Medicament desactivé'
    redirect_to @medicament
  end

  # DELETE /medicaments/1
  # DELETE /medicaments/1.json
  def destroy
    @medicament.destroy
    respond_to do |format|
      format.html { redirect_to medicaments_url, notice: 'Medicament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicament
      @medicament = Medicament.find(params[:id] || params[:medicament_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicament_params
      params.require(:medicament).permit(:nom, :reference)
    end
end
