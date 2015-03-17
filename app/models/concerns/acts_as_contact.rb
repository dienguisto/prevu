module ActsAsContact
  extend ActiveSupport::Concern

  included do
    has_many :contacts, foreign_key: :owner_id
    accepts_nested_attributes_for :contacts
  end
end