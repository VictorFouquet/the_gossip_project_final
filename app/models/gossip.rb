class Gossip < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	belongs_to :user
	validates :title,
		presence: true,
		length: { minimum: 1, maximum: 50 }
	validates :content,
		presence: true
end
