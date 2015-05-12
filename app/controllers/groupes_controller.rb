class GroupesController < ApplicationController
  before_action :set_groupe, only: [:show, :edit, :update, :destroy]

  # GET /groupes
  # GET /groupes.json
  def index
    @groupes = Groupe.none
    if current_user.user_system? or current_user.user_structure_assurance?
      @groupes = Groupe.all
    elsif current_user.user_structure_aperitrice?
      @groupes = current_structure_aperitrice.groupes
    end
  end

  # GET /groupes/1
  # GET /groupes/1.json
  def show
    if current_user.user_structure_assurance?
      @adherents = @groupe.adherents.where(structure_assurance: current_structure_assurance).page params[:page]
    else
      @adherents = @groupe.adherents.page params[:page]
    end
  end

  # GET /groupes/new
  def new
    @groupe = Groupe.new
    @groupe.contacts.build
  end

  # GET /groupes/1/edit
  def edit
  end

  # POST /groupes
  # POST /groupes.json
  def create
    @groupe = Groupe.new(groupe_params)

    @groupe.structure_assurance = current_structure_assurance if current_user.admin_structure_assurance?

    respond_to do |format|
      if @groupe.save
        format.html { redirect_to @groupe, notice: 'Groupe was successfully created.' }
        format.json { render :show, status: :created, location: @groupe }
      else
        format.html { render :new }
        format.json { render json: @groupe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupes/1
  # PATCH/PUT /groupes/1.json
  def update
    respond_to do |format|
      if @groupe.update(groupe_params)
        format.html { redirect_to @groupe, notice: 'Groupe was successfully updated.' }
        format.json { render :show, status: :ok, location: @groupe }
      else
        format.html { render :edit }
        format.json { render json: @groupe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupes/1
  # DELETE /groupes/1.json
  def destroy
    @groupe.destroy
    respond_to do |format|
      format.html { redirect_to groupes_url, notice: 'Groupe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupe
      @groupe = Groupe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groupe_params
      params.require(:groupe).permit(:nom, :structure_aperitrice_id, contacts_attributes: [:titre, :nom, :prenom, :telephone, :adresse, :email])
    end
end
