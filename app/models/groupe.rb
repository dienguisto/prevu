class Groupe < ActiveRecord::Base
  include ActsAsContact

  # has_many :affectation_aperitrices
  # has_many :structure_aperitrices, through: :affectation_aperitrices

  belongs_to :structure_aperitrice
  belongs_to :structure_assurance
  has_many :adherents

  validates :nom, presence: true, uniqueness: true

  def nombres_ordonnances(date=nil)
    ordonnances = Ordonnance.where(adherent: adherents)
    unless date.nil?
      ordonnances = ordonnances.where('DATE(created_at)=?', date)
    end
    ordonnances.count
  end

  def nombres_actes_medicaux(date=nil)
    consultations = Consultation.where(adherent: adherents)
    unless date.nil?
      consultations = consultations.where('DATE(created_at)=?', date)
    end
    consultations.count
  end

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
