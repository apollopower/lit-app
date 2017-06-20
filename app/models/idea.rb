class Idea < ApplicationRecord
<<<<<<< HEAD
  has_many :upvotes
  belongs_to :user

 # scope :most_recent, -> { order("created_at desc")}
 # scope :most_popular, -> { order("upvotes_count desc")}
 # scope :category, -> {where("category => category")}}

  #to allow the search to access information in the database, change LIKE to ILIKE when pushed to heroku
  def self.search(search)
    where("title LIKE ? OR summary LIKE ? OR description LIKE ? OR problem LIKE ? OR guidance LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def self.sort_by_date (setting="DESC")
    #this function sorts the ideas and return the ideas sorted
    Idea.all.order("created_at #{setting}")
  end

  def self.sort_by_upvote (setting= "DESC")
    Idea.order("upvotes_count DESC")
  end


=======
	belongs_to :user
	has_many :conversations
>>>>>>> master
end
