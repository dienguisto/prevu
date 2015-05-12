class StructureAssurance < ActiveRecord::Base
  include Activable
  include ActsAsContact

  has_attached_file :logo, styles: { medium: '300x300>', thumb: '100x100>'}
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  belongs_to :structure, polymorphic: true
  has_many :formules
  has_many :adherents
  has_many :ordonnances
  has_many :consultations
  has_many :versements
  has_many :groupes

  validates :nom, presence: true

  def total_a_verser_pharmacies(date=nil)
    if date.nil?
      ordonnances.reduce(0) {|s, o| s + o.montant_pris_en_charge}
    else
      ordonnances.where('DATE(created_at)=?', date).reduce(0) {|s, o| s + o.montant_pris_en_charge}
    end
  end

  def total_a_verser_structure_sanitaires(date=nil)
    if date.nil?
      consultations.reduce(0) {|s, c| s + c.montant_pris_en_charge}
    else
      consultations.where('DATE(created_at)=?', date).reduce(0) {|s, c| s + c.montant_pris_en_charge}
    end
  end
end
