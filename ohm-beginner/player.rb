class Player
  def play_turn(warrior)
    space = warrior.feel

    if space.enemy?
      warrior.attack!
    elsif warrior.health < 7
      warrior.rest!
    else
      warrior.walk!
    end
  end
end
