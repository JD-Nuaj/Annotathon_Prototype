class Annotation < ApplicationRecord
  belongs_to :user
  has_many :revisions, dependent: :destroy

  validates :sequence, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending approved rejected] }
end
