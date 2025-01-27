class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable

belongs_to :team, optional: true
has_many :annotations, dependent: :destroy
has_many :revisions, dependent: :destroy

validates :username, presence: true, uniqueness: true
validates :email, presence: true, uniqueness: true
validates :role, presence: true, inclusion: { in: %w[annotator instructor admin] }
end
