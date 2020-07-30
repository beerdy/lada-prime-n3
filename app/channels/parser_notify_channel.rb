class ParserNotifyChannel < ApplicationCable::Channel
  def subscribed
    stream_from "parser_notify_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
