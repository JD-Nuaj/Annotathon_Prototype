class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable

validates :username, presence: true, uniqueness: true
validates :role, inclusion: { in: %w[annotator instructor admin] }

belongs_to :team, optional: true

end
