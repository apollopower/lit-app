class Idea < ApplicationRecord
  has_many :upvotes
  belongs_to :user

  #to allow the search to access information in the database, change LIKE to ILIKE when pushed to heroku
  def self.search(search)
  where("title LIKE ? OR summary LIKE ? OR description LIKE ? OR problem LIKE ?OR guidance LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
