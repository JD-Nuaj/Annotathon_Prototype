class Topic < ApplicationRecord
  belongs_to :forum
  has_many :posts, dependent: :destroy

  validates :title, presence: true
end
