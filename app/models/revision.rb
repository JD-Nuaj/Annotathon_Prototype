class Revision < ApplicationRecord
  belongs_to :annotation
  belongs_to :user

  validates :change_log, presence: true
end
