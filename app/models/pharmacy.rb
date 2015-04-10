class Pharmacy < ActiveRecord::Base
  include ActsAsStructureSanitaire

  has_many :ordonnances

  def title
    "Pharmacie - #{nom}"
  end

  def montant_engage(date=nil)
    if date.nil?
      ordonnances.reduce(0) {|s, o| s + o.montant_pris_en_charge}
    else
      ordonnances.where('DATE(created_at)=?', date).reduce(0) {|s, o| s + o.montant_pris_en_charge}
    end
  end
end
