class Player
  def initialize
    @health = 20
  end

  def play_turn(warrior)
    space = warrior.feel

    if space.enemy?
      warrior.attack!
    elsif warrior.health < 20 and @health <= warrior.health
      warrior.rest!
    else
      warrior.walk!
    end

    @health = warrior.health
  end
end
