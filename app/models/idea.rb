class Idea < ApplicationRecord
	belongs_to :user
	has_many :conversations
end
