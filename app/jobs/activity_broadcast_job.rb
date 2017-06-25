class ActivityBroadcastJob < ApplicationJob
  queue_as :default

  def perform(current_user, idea_or_conversation_obj, conversation_id, is_verified = nil)

    if is_verified
      user = User.find(idea_or_conversation_obj.author_id)
      ActionCable.server.broadcast "activity_channel_#{user.id}", message: "#{current_user.first_name} accepted your request, go brainstorm!", url: "/ideas/#{idea_or_conversation_obj.idea.id}/conversations/#{conversation_id}", name: current_user.first_name, is_verified: true
    else
      user = User.find(idea_or_conversation_obj.user.id)
      ActionCable.server.broadcast "activity_channel_#{user.id}", message: "#{current_user.first_name} wants to talk to you!", url: "/conversations/#{conversation_id}", name: current_user.first_name
    end
  end

end
