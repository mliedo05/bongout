class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  validates :name, :lastname, :phone, presence: true
  ratyrate_rater
end
