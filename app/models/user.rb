class User < ActiveRecord::Base
  paginates_per 50
  include Roles
  ROLES_PREVU = {
      collecteur: 2
  }
  AUTRE_ROLES = {
      administrateur: 0,
      agent_saisie: 1
  }
  ROLES = ROLES_PREVU.merge AUTRE_ROLES
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: ROLES

  validates :role, presence: true
  # validates :entite_id , presence: true, unless: 'creator.try(:user_system?)'

  belongs_to :entite
  belongs_to :creator, foreign_key: :creator_id, class_name: User

  def profil
    if entite.nil?
      "#{role} - systeme"
    else
      "#{role} - #{entite.title}"
    end
  end

  def entities_he_can_add_for_users
    return Entite.none unless administrateur?
    if user_system?
      return @entites = Entite.all
    elsif user_structure_sanitaire? or user_structure_assurance? or user_structure_aperitrice?
      return [entite]
    end
    Entite.none
  end
end