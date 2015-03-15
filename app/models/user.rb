class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :entite
  ROLES = [:admin, :agent_saisie]
  enum role: ROLES

  validates :email,
      presence: true, uniqueness: true

  before_create :set_password

  def set_password

  end
end
