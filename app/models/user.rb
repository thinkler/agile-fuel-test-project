class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  validates :email, uniqueness: true
  validates :name,  presence:   true

  has_many :rewards, dependent: :destroy
end
