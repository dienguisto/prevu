class Entite < ActiveRecord::Base
  belongs_to :entite, polymorphic: true
  has_many :users

  delegate :title, to: :entite
end
