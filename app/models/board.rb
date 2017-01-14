class Board < ApplicationRecord
  def self.start(first_player)
    ActionCable.server.broadcast first_player, { action: "board_start", msg: "new" }
    $REDIS["host_for:#{first_player}"] = first_player
  end

  def self.add(player_name)
    ActionCable.server.broadcast player_name, { action: "add_player", msg: "add" }
    $REDIS["pen_for:#{player_name}"] = player_name 
  end
end
