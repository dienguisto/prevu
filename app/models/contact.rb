class Contact < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  def full_name
    "#{prenom} #{nom}"
  end
end
