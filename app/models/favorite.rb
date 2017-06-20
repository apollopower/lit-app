class Favorite < ApplicationRecord
  belongs_to :idea, polymorphic: true
  belongs_to :user
end
