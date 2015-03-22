class User < ActiveRecord::Base
  include Roles
  ROLES = {
      administrateur: 0,
      agent_saisie: 1
  }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: ROLES

  validates :role, presence: true

  belongs_to :entite
end