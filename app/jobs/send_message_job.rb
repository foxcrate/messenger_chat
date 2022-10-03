class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message, current_user)
    puts "$$ preforming the job $$"

    mine = ApplicationController.render(
      partial: 'messages/mine',
      locals: {message: message, current_user:current_user}
    )

    theirs = ApplicationController.render(
      partial: 'messages/theirs',
      locals: {message: message, current_user:current_user}
    )

    data_object = {
      "mine"=> mine,
      "theirs"=> theirs,
      "message"=>message
    }

    ActionCable.server.broadcast "room_channel_#{message.room_id}", data_object
  end
end