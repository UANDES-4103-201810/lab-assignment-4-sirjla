class User < ApplicationRecord
  has_many :user_tickets
	has_many :tickets, :through => :user_tickets
  validates :email, format: { with: /\A.*@.*\..*\z/}
  validates :phone, format: {with: /\A\d{9,12}\z/}
  validates :password, format: {with: /\A[a-zA-Z0-9\.]{8,12}\z/}
end
