class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :idea


  def self.problem_addressed
    Comment.where("topic = 'Problem Being Addressed'")
  end

  def self.enhance_idea
    Comment.where(comments.topic = "Ways To Enhance Idea")
  end

  def self.implementing_idea
    Comment.where(comments.topic = "Implementing Idea")
  end

  def self.disagree
    Comment.where(topic = "Disagree with Aspect of Idea")
  end

  def self.other
    Comment.where(comments.topic = "Other")
  end

end
