class Session < ApplicationRecord
  def self.create(uuid)
    if $REDIS.get("session").nil?
      $REDIS["session"] = uuid
      #puts $REDIS["points"]
    else
      uuid = $REDIS.get("session")
      puts $REDIS.lrange("xpoints", 0, -1)
      puts $REDIS.lrange("ypoints", 0, -1)
      Board.add(uuid)
    end
      # Clear the waiting key as no one new is waiting
  end

end
