class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  
  validates :name, :lastname, :phone, presence: true
  ratyrate_rater
end
