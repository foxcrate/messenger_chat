class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message, current_user)
    html = ApplicationController.render(
      partial: 'messages/message',
      locals: {message: message, current_user:current_user}
    )

    ActionCable.server.broadcast "room_channel_#{message.room_id}" , html
    puts "####### aloo from the job #######"
  end
end