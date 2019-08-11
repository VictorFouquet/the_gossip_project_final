class User < ApplicationRecord
	has_secure_password
	validates :password,
		presence: true,
		length: { minimum: 6, maximum: 30 }
	has_many :gossips, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :sent_messages, foreign_key: "sender", class_name: "PrivateMessage"
	has_many :received_messages, foreign_key: "recipient", class_name: "PrivateMessage"
	belongs_to :city
end
