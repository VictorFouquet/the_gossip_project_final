class User < ApplicationRecord
	has_secure_password
	validates :password,
		presence: true,
		length: { minimum: 6, maximum: 30 }
	has_many :gossips, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	belongs_to :city
end
