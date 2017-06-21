class Upvote < ApplicationRecord
  #counter cache will keep value up to date and return that value in response to size method 'idea.upvotes.size'
  belongs_to :idea, counter_cache: true
  belongs_to :user
end
