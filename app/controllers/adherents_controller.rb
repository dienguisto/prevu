class AdherentsController < ApplicationController
  before_action :set_adherent, only: [:show, :edit, :update, :destroy, :activate, :desactivate]

  def new
    @adherent = Adherent.new
  end

  def new_parrainage
    @adherent = Adherent.new
  end

  def signin
    @adherent = Adherent.new(params[:adherent])
    if @adherent.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
  # GET /adherents
  # GET /adherents.json
  def index
    @adherents = Adherent.all
  end

  # GET /adherents/1
  # GET /adherents/1.json
  def show
  end

  # GET /adherents/1/edit
  def edit
  end

  def edit_parrainage
    @adherent = Adherent.find(params[:adherent_id])
  end

  # POST /adherents
  # POST /adherents.json
  def create
    @adherent = Adherent.new(adherent_params)

    respond_to do |format|
      if @adherent.save
        format.html { redirect_to @adherent, notice: 'Adherent was successfully created.' }
        format.json { render :show, status: :created, location: @adherent }
      else
        format.html { render :new }
        format.json { render json: @adherent.errors, status: :unprocessable_entity }
      end
    end
  end

  def affiliers
    @adherents = Adherent.where('parrain_id=?', current_adherent.id)
  end

  # PATCH/PUT /adherents/1
  # PATCH/PUT /adherents/1.json
  def update
    respond_to do |format|
      if @adherent.update(adherent_params)
        format.html { redirect_to @adherent, notice: 'Adherent was successfully updated.' }
        format.json { render :show, status: :ok, location: @adherent }
      else
        format.html { render :edit }
        format.json { render json: @adherent.errors, status: :unprocessable_entity }
      end
    end
  end

  def activate
    respond_to do |format|
      @adherent.status = 2
      @adherent.last_activation = Time.now
      if @adherent.save
        format.html { redirect_to [@adherent], notice: 'Adherent was successfully activated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to [@adherent], warning: 'Something went wrong' }
        format.json { render json: @adherent.errors, status: :unprocessable_entity }
      end
    end
  end

  def desactivate
    respond_to do |format|
      @adherent.status = 3
      @adherent.last_suspension = Time.now
      if @adherent.save
        format.html { redirect_to [@adherent], notice: 'Adherent was successfully disabled.' }
        format.json { head :no_content }
      else
        format.html { redirect_to [@adherent], warning: 'Something went wrong' }
        format.json { render json: @adherent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adherents/1
  # DELETE /adherents/1.json
  def destroy
    @adherent.status = 4
    @adherent.last_delete = Time.now
    @adherent.save
    respond_to do |format|  
      format.html { redirect_to adherents_url, notice: 'Adherent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adherent
      @adherent = Adherent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adherent_params
      params.require(:adherent).permit(:nom, :prenom, :status_matrimonial, :date_de_naissance, :lieu_de_naissance,
                                      :password_txt, :password_txt_confirmation, :montant_cotisation, :avatar, :email,
                                      :sexe, :parrain_id, :affiliation, :groupe_id, :tags,
                                      :contacts_attributes => [:telephone, :telephone1, :adresse, :email])
    end
end
