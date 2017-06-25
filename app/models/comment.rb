class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  def self.problem_addressed
    where("topic iLike 'Problem Being Addressed'")
  end

  def self.enhance_idea
    where("topic iLike 'Ways To Enhance Idea'")
  end

  def self.implementing_idea
    where("topic iLike 'Implementing Idea'")
  end

  def self.disagree
    where("topic iLike 'Disagree with Aspect of Idea'")
  end

  def self.other
    where("topic iLike 'Other'")
  end

end
