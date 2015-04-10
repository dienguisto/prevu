class FormationSanitaire < ActiveRecord::Base
  include ActsAsStructureSanitaire
  has_many :consultations
  NIVEAU = {
      n1: 0,
      n2: 1,
      n3: 2,
      cp: 3
  }
  enum niveau: NIVEAU
  validates :niveau, presence: true

  def title
    "Formation sanitaire - #{nom}"
  end

  def montant_engage(date=nil)
    if date.nil?
      consultations.reduce(0) {|s, o| s + o.montant_pris_en_charge}
    else
      consultations.where('DATE(created_at)=?', date).reduce(0) {|s, o| s + o.montant_pris_en_charge}
    end
  end
end