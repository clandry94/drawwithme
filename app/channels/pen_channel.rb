class PenChannel < ApplicationCable::Channel
  def subscribed
   stream_from "player_#{uuid}"
   Session.create(uuid)
  end

  def unsubscribed
  end

  def receive(data)
    #Session.draw(uuid, data)
    $REDIS.rpush("xpoints", data["x"])
    $REDIS.rpush("ypoints", data["y"])
    puts "ADDED POINT!!"
  end
end
