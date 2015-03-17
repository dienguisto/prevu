class Contact < ActiveRecord::Base

  belongs_to :adherent, foreign_key: :owner_id, :class_name => Adherent
end
