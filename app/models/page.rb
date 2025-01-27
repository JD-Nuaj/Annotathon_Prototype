class Page < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :namespace, presence: true, inclusion: { in: %w[static dynamic] }
end
