class Conversation < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  belongs_to :idea


end
