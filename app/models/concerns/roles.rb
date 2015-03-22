module Roles
  extend ActiveSupport::Concern

  def user_system?
    entite.nil?
  end

  def admin_system?
    administrateur? and user_system?
  end

  def agent_saisie_system?
    agent_saisie? and user_system?
  end

  def user_mutuelle?
    return false if entite.nil?
    entite.entite.is_a?(Mutuelle)
  end

  def user_micro_assurance?
    return false if entite.nil?
    entite.entite.is_a?(MicroAssurance)
  end

  def user_formation_sanitaire?
    return false if entite.nil?
    entite.entite.is_a?(FormationSanitaire)
  end

  def user_pharmacie?
    return false if entite.nil?
    entite.entite.is_a?(Pharmacy)
  end

  def user_structure_aperitrice?
    return false if entite.nil?
    entite.entite.is_a?(StructureAperitrice)
  end

  def admin_mutuelle?
    administrateur? and user_mutuelle?
  end

  def agent_saisie_mutuelle?
    agent_saisie? and user_mutuelle?
  end

  def admin_micro_assurance?
    administrateur? and user_micro_assurance?
  end

  def agent_saisie_micro_assurance?
    agent_saisie? and user_micro_assurance?
  end

  def admin_formation_sanitaire?
    administrateur? and user_formation_sanitaire?
  end

  def agent_saisie_formation_sanitaire?
    agent_saisie? and user_formation_sanitaire?
  end

  def admin_pharmacie?
    administrateur? and user_pharmacie?
  end

  def agent_saisie_pharmacie?
    agent_saisie? and user_pharmacie?
  end

  def admin_structure_aperitrice?
    administrateur? and user_structure_aperitrice?
  end

  def agent_saisie_structure_aperitrice?
    agent_saisie? and user_structure_aperitrice?
  end
end