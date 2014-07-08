module PusherModule

  def self.notify_visitors_new_feeling(data)
    self.notify('visitors', 'new_feeling', data)
  end

  def self.notify(channel, event, data)
    Pusher[channel].trigger(event, data)
  end
end