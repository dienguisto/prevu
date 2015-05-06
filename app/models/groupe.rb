class Groupe < ActiveRecord::Base
  include ActsAsContact

  # has_many :affectation_aperitrices
  # has_many :structure_aperitrices, through: :affectation_aperitrices

  belongs_to :structure_aperitrice
  has_many :adherents

  validates :nom, presence: true, uniqueness: true

  def total_a_verser_pharmacies(date=nil)
    ordonnances = Ordonnance.where(adherent: adherents)
    if date.nil?
      ordonnances.reduce(0) {|s, o| s + o.montant_pris_en_charge}
    else
      ordonnances.where('DATE(created_at)=?', date).reduce(0) {|s, o| s + o.montant_pris_en_charge}
    end
  end

  def total_a_verser_structure_sanitaires(date=nil)
    consultations = Consultation.where(adherent: adherents)
    if date.nil?
      consultations.reduce(0) {|s, c| s + c.montant_pris_en_charge}
    else
      consultations.where('DATE(created_at)=?', date).reduce(0) {|s, c| s + c.montant_pris_en_charge}
    end
  end
end
