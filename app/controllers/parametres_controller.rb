class ParametresController < ApplicationController
  before_action :set_update_params, only: [:update]
  before_action :delete_params, only: [:destroy]

  def categories
    @categories = CategorieActeMedical.all
  end

  def index
    @groupes = Groupe.all
    @medicaments = Medicament.all
    @tags = Tag.all
    @categories = CategorieActeMedical.all
    @type_acte_medicals = TypeActeMedical.all
  end


  def add_tag
    @tag = Tag.new(nom: params[:nom])
    if @tag.valid? and @tag.save
      render @tag.as_json
    else
      render :nothing => true, :status => :not_acceptable
    end
  end


  def add_type_acte_medical
    @type = TypeActeMedical.new(nom: params[:nom], categorie_acte_medical_id: params[:categorie])
    if @type.valid? and @type.save
      render @type.as_json
    else
      render :nothing => true, :status => :not_acceptable
    end
  end

  def add_categorie_acte_medical
    @categorie = CategorieActeMedical.new(nom: params[:nom])
    if @categorie.valid? and @categorie.save
      render @categorie.as_json
    else
      render :nothing => true, :status => :not_acceptable
    end
  end

  def update
    if @entite.update(set_update_params)
      render @entite.as_json
    else
      render :nothing => true, :status => :not_acceptable
    end
  end

  def destroy
    @entite.destroy
    respond_to do |format|
      format.html { redirect_to parametres_path, notice: 'Element was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_update_params
    @entite = nil
    data = nil
    if params[:tag_id]
      @entite = Tag.find(params[:tag_id])
      data = {:nom => params[:nom], :id => params[:tag_id]}
    elsif params[:categ_id]
      @entite = CategorieActeMedical.find(params[:categ_id])
      data = {:nom => params[:nom], :id => params[:categ_id]}
    elsif params[:type_id]
      @entite = TypeActeMedical.find(params[:type_id])
      data = {:nom => params[:nom], :id => params[:type_id], :categorie_id => params[:categ_id]}
    end
    data
  end

  def delete_params
    @entite = nil
    if params[:tag_id]
      @entite = Tag.find(params[:tag_id])
    elsif params[:categ_id]
      @entite = CategorieActeMedical.find(params[:categ_id])
    elsif params[:type_id]
      @entite = TypeActeMedical.find(params[:type_id])
    end
    @entite
  end

end
