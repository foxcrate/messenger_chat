class RoomChannel < ApplicationCable::Channel
  def subscribed
    # puts "$$$$$$$ #{params[:room_id]} $$$$$$"
    # users_ids = active_users channel_name
    puts "$$$$$$$ subscribed $$$$$$$$"
    # stop_all_streams
    stream_from "room_channel_#{params[:room_id]}"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
