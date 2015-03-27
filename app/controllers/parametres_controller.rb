class ParametresController < ApplicationController

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


  def add_groupe
    @groupe = Groupe.new(nom: params[:nom])
    if @groupe.valid? and @groupe.save
      render @groupe.as_json
    else
      render :nothing => true, :status => :not_acceptable
    end
  end

  def add_tag
    @tag = Tag.new(libelle: params[:nom])
    if @tag.valid? and @tag.save
      render @tag.as_json
    else
      render :nothing => true, :status => :not_acceptable
    end
  end

  def add_medicament
    @medicament = Medicament.new(nom: params[:nom], reference: params[:reference])
    if @medicament.valid? and @medicament.save
      render @medicament.as_json
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
end
