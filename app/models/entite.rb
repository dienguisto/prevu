class Entite < ActiveRecord::Base
  belongs_to :entite, polymorphic: true
end
