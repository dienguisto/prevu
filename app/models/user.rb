class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :entite
  ROLES = {
      admin: 0,
      agent_saisie: 1
  }
  enum role: ROLES

  validates :email,
      presence: true, uniqueness: true

end
