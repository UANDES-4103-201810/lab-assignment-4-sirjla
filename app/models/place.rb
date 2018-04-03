class Place < ApplicationRecord
	has_many :events
	validates :name, format: { with: /\A[\w|\s]{20,}\z/}
	validates :capacity, numericality: { greater_than_or_equal_to: 0}
end
