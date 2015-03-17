class Entite < ActiveRecord::Base
  belongs_to :entite, polymorphic: true
  has_many :users

  def title
    "Random title"
  end
end
