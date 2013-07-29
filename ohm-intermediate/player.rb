class Player
  def play_turn(warrior)
    stairs_direction = warrior.direction_of_stairs
    warrior.walk! stairs_direction
  end
end
