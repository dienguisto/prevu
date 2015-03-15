module ActsAsEntite
  extend ActiveSupport::Concern

  included do
    has_one :entite, as: :entite, dependent: :destroy

    after_create { create_entite }
  end
end