class Adherent < ActiveRecord::Base
  paginates_per 50
  include BCrypt
  include ActsAsContact
  include ActsAsAccountOwner
  delegate :email, to: :default_contact

  TYPE_PIECE = {
      carte_nationale_identite: 0,
      passport: 1
  }

  SEXE = { 'Masculin' => 0, 'Feminin' => 1 }

  MATRIMONIAL = {
      "Célibataire" => 1,
      "Marié(e)" => 2,
      "Divorcé(e)" => 3,
      "Veuf(ve)" => 4
  }

  STATUS = {'En attente' => 1, 'Actif' => 2, 'Suspendu' => 3, 'Supprimé' => 4}
  AFFILIATION = {"Parrainage" => 0, "Fils" => 1, "Fille" => 2, "Epoux" => 3, "Epouse" => 4}

  enum affiliations: AFFILIATION
  enum type_piece_identite: TYPE_PIECE

  has_and_belongs_to_many :tags
  belongs_to :parrain, foreign_key: :parrain_id, class_name: Adherent
  has_many :filleuls, foreign_key: :parrain_id, :class_name => Adherent
  has_many :ordonnances
  has_many :consultations
  belongs_to :default_contact, foreign_key: :contact_id, class_name: Contact
  belongs_to :groupe
  belongs_to :structure_assurance
  has_many :souscriptions
  has_many :formules, through: :souscriptions
  has_many :cotisations

  before_create :encrypt_password
  before_create :generate_matricule
  before_create :set_status
  after_create :set_default_contact

  validates :prenom, :nom, :date_de_naissance, :lieu_de_naissance, :sexe, :status_matrimonial, :structure_assurance_id,
            presence: true

  validates :numero_piece_identite, uniqueness: true
  #validates_presence_of :password_txt, :on => :create

  #  has_secure_password
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  accepts_nested_attributes_for :souscriptions,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['formule'].nil? }
  accepts_nested_attributes_for :filleuls,
                                allow_destroy: true

  def self.authenticate(matricule, password_txt)
    adherent = find_by_matricule(matricule)
    if adherent && adherent.password_digest == BCrypt::Engine.hash_secret(password_txt, adherent.password_salt)
      adherent
    else
      nil
    end
  end

  def encrypt_password
    generated_password = Devise.friendly_token.first(8)
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_digest = BCrypt::Engine.hash_secret(generated_password, password_salt)
    AdherentMailer.welcome(self.email, generated_password).deliver_later unless self.try(:default_contact).try(:email).nil?
  end

  def generate_matricule
    last_adherent = Adherent.count
    current_date = Date.today.strftime('%Y%m%d')
    self.matricule = current_date+''+(last_adherent+1).to_s.rjust(6,'0')
  end

  def set_status
    self.status = 1
  end

  def full_name
    "#{prenom} #{nom}"
  end

  def set_default_contact
    self.update(default_contact: contacts.first)
  end

  def souscription_en_cours
    souscriptions.en_cours.last
  end

  def formule_en_cours
    souscription_en_cours.try :formule
  end
end
